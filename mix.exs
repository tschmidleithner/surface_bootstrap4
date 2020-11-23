defmodule SurfaceBootstrap4.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_bootstrap4,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.0"},
      {:floki, "~> 0.25.0", only: :test},
      {:surface, "~> 0.1.0"},
      {:ex_parameterized, "~> 1.3.7", only: :test}
    ]
  end
end
