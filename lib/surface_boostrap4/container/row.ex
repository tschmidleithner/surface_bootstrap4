defmodule SurfaceBootstrap4.Container.Row do
  @moduledoc """
  Bootstrap4 row for the container component.
  """

  use Surface.Component

  @doc "The type of the container"
  property no_gutters, :boolean, default: false

  @doc """
  The content of the generated row.
  """
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      class={{
        "row",
        "no-gutters": @no_gutters
      }}
    >
      <slot></slot>
    </div>
    """
  end
end
