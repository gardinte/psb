defmodule Psb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Psb.Handler, []}
    ]

    opts = [strategy: :one_for_one, name: Psb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
