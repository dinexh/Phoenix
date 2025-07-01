defmodule FoodMenuApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoodMenuApiWeb.Telemetry,
      FoodMenuApi.Repo,
      {DNSCluster, query: Application.get_env(:food_menu_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FoodMenuApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FoodMenuApi.Finch},
      # Start a worker by calling: FoodMenuApi.Worker.start_link(arg)
      # {FoodMenuApi.Worker, arg},
      # Start to serve requests, typically the last entry
      FoodMenuApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodMenuApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodMenuApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
