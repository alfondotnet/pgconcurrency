# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :pgconcurrency, ecto_repos: [PGCon.Repo]

config :pgconcurrency, PGCon.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "pgcon_test"
