# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphql_fitness_tracker,
  ecto_repos: [GraphqlFitnessTracker.Repo]

# Configures the endpoint
config :graphql_fitness_tracker, GraphqlFitnessTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QRSdc75BCXT7Fep/5qniosebCHLp9iXIxym+WmikerYj+nu2ei50GPOxM4en4zkm",
  render_errors: [view: GraphqlFitnessTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GraphqlFitnessTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
