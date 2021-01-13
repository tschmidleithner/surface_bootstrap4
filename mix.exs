defmodule SurfaceBootstrap4.MixProject do
  use Mix.Project

  @source_url "https://github.com/tschmidleithner/surface_bootstrap4"
  @version "0.1.0"

  def project do
    [
      app: :surface_bootstrap4,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      description: description(),
      package: package(),
      deps: deps(),
      source_url: @source_url
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
      {:floki, "~> 0.29", only: :test},
      {:surface, "~> 0.1"},
      {:ex_parameterized, "~> 1.3.7", only: :test}
    ]
  end

  defp description do
    "A set of Surface components based on Bootstrap 4 for Phoenix LiveView."
  end

  defp package do
    [
      maintainers: ["Thomas Schmidleithner"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
