defmodule IdeaInboxWeb.PageController do
  use IdeaInboxWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
