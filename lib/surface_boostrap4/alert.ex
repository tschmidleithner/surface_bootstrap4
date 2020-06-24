defmodule SurfaceBootstrap4.Alert do
  @moduledoc """
  Bootstrap4 alert component.

  ## Examples
  ```
  <SurfaceBootstrap4.Alert color="primary">A simple primary alert.</SurfaceBootstrap4.Alert>
  ```
  """

  use Surface.Component

  @doc "Additional CSS classes"
  property class, :css_class

  @doc "The color of the alert"
  property color, :string, values: ~w(primary secondary success info warning danger light dark)

  @doc "Triggered on click"
  property toggle, :event

  @doc """
  The content of the generated `<div>` element.
  """
  slot(default)

  def render(assigns) do
    ~H"""
    <div
      class={{
        :alert,
        @class,
        "alert-#{@color}": @color
      }}
    >
      <slot />

      <button
        :if={{@toggle}}
        :on-phx-click={{@toggle}}
        type="button"
        class="close"
        data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    """
  end
end
