defmodule Psb.MixProject do
  use Mix.Project

  def project do
    [
      app: :psb,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Psb.Application, []}
    ]
  end

  defp deps do
    [
      {:broadway_cloud_pub_sub, ">= 0.4.0"},
      {:goth, ">= 1.1.0"},
      {:jason, ">= 1.1.0"}
    ]
  end
end
