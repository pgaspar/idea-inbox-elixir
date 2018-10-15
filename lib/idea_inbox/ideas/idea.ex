defmodule IdeaInbox.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:id, :up_votes, :down_votes]}

  schema "ideas" do
    field :title, :string
    field :up_votes, :integer, default: 0
    field :down_votes, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:title, :up_votes, :down_votes])
    |> validate_required([:title])
  end
end
