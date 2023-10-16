defmodule Blah.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Boundary, top_level?: true, deps: [Blah, BlahWeb]

  @impl true
  def start(_type, _args) do
    children = [
      BlahWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:blah, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Blah.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Blah.Finch},
      # Start a worker by calling: Blah.Worker.start_link(arg)
      # {Blah.Worker, arg},
      # Start to serve requests, typically the last entry
      BlahWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Blah.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlahWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
