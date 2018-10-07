defmodule IdeaInboxWeb.Router do
  use IdeaInboxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IdeaInboxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", IdeaController, :index
    resources "/ideas", IdeaController, only: [:show, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", IdeaInboxWeb do
  #   pipe_through :api
  # end
end
