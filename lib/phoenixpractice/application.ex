defmodule Phoenixpractice.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixpracticeWeb.Telemetry,
      Phoenixpractice.Repo,
      {DNSCluster, query: Application.get_env(:phoenixpractice, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Phoenixpractice.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Phoenixpractice.Finch},
      # Start a worker by calling: Phoenixpractice.Worker.start_link(arg)
      # {Phoenixpractice.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixpracticeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phoenixpractice.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixpracticeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
