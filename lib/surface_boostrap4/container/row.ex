defmodule SurfaceBootstrap4.Container.Row do
  @moduledoc """
  Bootstrap4 row for the container component.
  """

  use Surface.Component

  @doc "The type of the container"
  property no_gutters, :boolean, default: false

  @doc "Additional CSS classes"
  property class, :css_class

  @doc """
  The content of the generated row.
  """
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      class={{
        :row,
        @class,
        "no-gutters": @no_gutters
      }}
    >
      <slot></slot>
    </div>
    """
  end
end
