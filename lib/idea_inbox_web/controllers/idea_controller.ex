defmodule IdeaInboxWeb.IdeaController do
  use IdeaInboxWeb, :controller

  alias IdeaInbox.Ideas
  alias IdeaInbox.Ideas.Idea

  def index(conn, _params) do
    ideas = Ideas.list_ideas()
    changeset = Ideas.change_idea(%Idea{})
    render(conn, "index.html", ideas: ideas, changeset: changeset)
  end

  def create(conn, %{"idea" => idea_params}) do
    case Ideas.create_idea(idea_params) do
      {:ok, idea} ->
        conn
        |> put_flash(:info, "Idea created successfully.")
        |> redirect(to: idea_path(conn, :show, idea))
      {:error, %Ecto.Changeset{} = changeset} ->
        ideas = Ideas.list_ideas()
        render(conn, "index.html", changeset: changeset, ideas: ideas)
    end
  end

  def show(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id)
    render(conn, "show.html", idea: idea)
  end
end
