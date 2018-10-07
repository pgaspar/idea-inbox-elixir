defmodule IdeaInbox.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ideas" do
    field :title, :string
    field :up_votes, :integer, default: 0
    field :down_votes, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
