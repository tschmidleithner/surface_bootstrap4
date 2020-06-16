defmodule SurfaceBootstrap4.Container do
  @moduledoc """
  Bootstrap4 container.
  """

  use Surface.Component

  @doc "The type of the container"
  property fluid, :boolean, default: false

  @doc "Additional CSS classes"
  property class, :css_class

  @doc """
  The content of the generated container.
  """
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      class={{
        @class,
        container: !@fluid,
        "container-fluid": @fluid
      }}
    >
      <slot></slot>
    </div>
    """
  end
end
