defmodule IdeaInboxWeb.VotesChannel do
  use IdeaInboxWeb, :channel

  alias IdeaInbox.Ideas
  alias IdeaInbox.Ideas.Idea

  def join("votes:" <> idea_id, payload, socket) do
    idea = Ideas.get_idea!(String.to_integer(idea_id))

    {:ok, %{}, assign(socket, :idea, idea)}
  end

  def handle_in("votes:vote_up", payload, socket) do
    idea = socket.assigns.idea
    result = Ideas.update_idea(idea, %{up_votes: idea.up_votes + 1})

    case result do
      {:ok, idea} ->
        broadcast!(socket, "votes:update", %{idea: idea})
        {:reply, :ok, assign(socket, :idea, idea)}
      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end

  def handle_in("votes:vote_down", payload, socket) do
    idea = socket.assigns.idea
    result = Ideas.update_idea(idea, %{down_votes: idea.down_votes + 1})

    case result do
      {:ok, idea} ->
        broadcast!(socket, "votes:update", %{idea: idea})
        {:reply, :ok, assign(socket, :idea, idea)}
      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end
end
