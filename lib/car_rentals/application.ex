defmodule CarRentals.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CarRentalsWeb.Telemetry,
      CarRentals.Repo,
      {DNSCluster, query: Application.get_env(:car_rentals, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CarRentals.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CarRentals.Finch},
      # Start a worker by calling: CarRentals.Worker.start_link(arg)
      # {CarRentals.Worker, arg},
      # Start to serve requests, typically the last entry
      CarRentalsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CarRentals.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CarRentalsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
