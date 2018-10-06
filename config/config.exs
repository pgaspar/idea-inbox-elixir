# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :idea_inbox,
  ecto_repos: [IdeaInbox.Repo]

# Configures the endpoint
config :idea_inbox, IdeaInboxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "etZVGCb3oz+ejv9LUL2JJYf5tDFMLzeP7RZ6gT6LBJgEvYKTYbjpsMNfxKIzu4pi",
  render_errors: [view: IdeaInboxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IdeaInbox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
