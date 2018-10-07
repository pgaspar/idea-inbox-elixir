defmodule IdeaInbox.Repo.Migrations.CreateIdeas do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :title, :string
      add :up_votes, :integer
      add :down_votes, :integer

      timestamps()
    end

  end
end
