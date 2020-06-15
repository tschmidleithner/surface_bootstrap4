defmodule SurfaceBootstrap4.Container do
  @moduledoc """
  Bootstrap4 container.
  """

  use Surface.Component

  @doc "The type of the container"
  property fluid, :boolean, default: false

  @doc """
  The content of the generated container.
  """
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      class={{
        container: !@fluid,
        "container-fluid": @fluid
      }}
    >
      <slot></slot>
    </div>
    """
  end
end
