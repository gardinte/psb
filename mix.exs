defmodule Psb.MixProject do
  use Mix.Project

  def project do
    [
      app: :psb,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Psb.Application, []},
      extra_applications: [:logger, :goth]
    ]
  end

  defp deps do
    [
      {:broadway_cloud_pub_sub, ">= 0.6.0"},
      {:goth, ">= 1.2.0"},
      {:jason, ">= 1.2.0"}
    ]
  end
end
