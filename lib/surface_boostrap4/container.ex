defmodule SurfaceBootstrap4.Container do
  @moduledoc """
  Bootstrap4 container.

  ## Examples
  ```
  <SurfaceBootstrap4.Container>
    <SurfaceBootstrap4.Container.Row>
      <SurfaceBootstrap4.Container.Col>
        Container -> Row -> Column
      </SurfaceBootstrap4.Container.Col>
    </SurfaceBootstrap4.Container.Row>
  </SurfaceBootstrap4.Container>
  ```
  """

  use Surface.Component

  @doc "The type of the container"
  prop fluid, :boolean, default: false

  @doc "Additional CSS classes"
  prop class, :css_class

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
