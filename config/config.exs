# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :conduit,
  ecto_repos: [Conduit.Repo]

# Configures the endpoint
config :conduit, ConduitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zddqBSTQNSGnxs5pAoN2p6osqT7l2hGalcIRZdi366uJgD/+sxrPwgAWMTzwv78x",
  render_errors: [view: ConduitWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Conduit.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "SMGeNQSc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use Event Store
config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

# Event store
config :conduit, Conduit.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "conduit_eventstore_dev",
  hostname: "localhost",
  port: 5433,
  pool_size: 10

config :conduit, event_stores: [Conduit.EventStore]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
