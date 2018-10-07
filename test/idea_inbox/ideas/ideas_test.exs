defmodule IdeaInbox.IdeasTest do
  use IdeaInbox.DataCase

  alias IdeaInbox.Ideas

  describe "ideas" do
    alias IdeaInbox.Ideas.Idea

    @valid_attrs %{down_votes: 42, timestamps: "some timestamps", title: "some title", up_votes: 42}
    @update_attrs %{down_votes: 43, timestamps: "some updated timestamps", title: "some updated title", up_votes: 43}
    @invalid_attrs %{down_votes: nil, timestamps: nil, title: nil, up_votes: nil}

    def idea_fixture(attrs \\ %{}) do
      {:ok, idea} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ideas.create_idea()

      idea
    end

    test "list_ideas/0 returns all ideas" do
      idea = idea_fixture()
      assert Ideas.list_ideas() == [idea]
    end

    test "get_idea!/1 returns the idea with given id" do
      idea = idea_fixture()
      assert Ideas.get_idea!(idea.id) == idea
    end

    test "create_idea/1 with valid data creates a idea" do
      assert {:ok, %Idea{} = idea} = Ideas.create_idea(@valid_attrs)
      assert idea.down_votes == 42
      assert idea.timestamps == "some timestamps"
      assert idea.title == "some title"
      assert idea.up_votes == 42
    end

    test "create_idea/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ideas.create_idea(@invalid_attrs)
    end

    test "update_idea/2 with valid data updates the idea" do
      idea = idea_fixture()
      assert {:ok, idea} = Ideas.update_idea(idea, @update_attrs)
      assert %Idea{} = idea
      assert idea.down_votes == 43
      assert idea.timestamps == "some updated timestamps"
      assert idea.title == "some updated title"
      assert idea.up_votes == 43
    end

    test "update_idea/2 with invalid data returns error changeset" do
      idea = idea_fixture()
      assert {:error, %Ecto.Changeset{}} = Ideas.update_idea(idea, @invalid_attrs)
      assert idea == Ideas.get_idea!(idea.id)
    end

    test "delete_idea/1 deletes the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{}} = Ideas.delete_idea(idea)
      assert_raise Ecto.NoResultsError, fn -> Ideas.get_idea!(idea.id) end
    end

    test "change_idea/1 returns a idea changeset" do
      idea = idea_fixture()
      assert %Ecto.Changeset{} = Ideas.change_idea(idea)
    end
  end
end
