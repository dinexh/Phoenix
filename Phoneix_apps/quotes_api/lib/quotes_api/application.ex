defmodule QuotesApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      QuotesApiWeb.Telemetry,
      QuotesApi.Repo,
      {DNSCluster, query: Application.get_env(:quotes_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: QuotesApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: QuotesApi.Finch},
      # Start a worker by calling: QuotesApi.Worker.start_link(arg)
      # {QuotesApi.Worker, arg},
      # Start to serve requests, typically the last entry
      QuotesApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QuotesApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuotesApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
