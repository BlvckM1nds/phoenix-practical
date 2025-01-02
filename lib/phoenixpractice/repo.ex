defmodule Phoenixpractice.Repo do
  use Ecto.Repo,
    otp_app: :phoenixpractice,
    adapter: Ecto.Adapters.Postgres
end
