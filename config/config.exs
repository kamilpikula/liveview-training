# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :liveview_training,
  ecto_repos: [LiveviewTraining.Repo]

# Configures the endpoint
config :liveview_training, LiveviewTrainingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Lsz3hcw6kgb1Bj5a7+fIMEYZm8M7T1kXdwiWeiQ9Ux24GoNVubnWpPW2xyxTVWuE",
  render_errors: [view: LiveviewTrainingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveviewTraining.PubSub,
  live_view: [signing_salt: "/YGaaD5f"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
