defmodule SurfaceBootstrap4.ButtonGroup do
  @moduledoc """
  Bootstrap4 button group component to group a series of buttons together.

  ## Examples
  ```
  <SurfaceBootstrap4.ButtonGroup>
    <SurfaceBootstrap4.Button color="secondary">
      Left
    </SurfaceBootstrap4.Button>
    <SurfaceBootstrap4.Button color="secondary">
      Middle
    </SurfaceBootstrap4.Button>
    <SurfaceBootstrap4.Button color="secondary">
      Right
    </SurfaceBootstrap4.Button>
  </SurfaceBootstrap4.ButtonGroup>
  ```
  """

  use Surface.Component

  @doc "The size of buttons within the button group"
  prop size, :string, values: ~w(sm md lg)

  @doc "Vertical stack buttons"
  prop vertical, :boolean, default: false

  @doc "Additional CSS classes"
  prop class, :css_class

  def render(assigns) do
    ~H"""
    <div
      class={{
        @class,
        "btn-group": !@vertical,
        "btn-group-vertical": @vertical,
        "btn-group-#{@size}": @size
      }}
    >
      <slot/>
    </div>
    """
  end
end
