defmodule SurfaceBootstrap4.Button do
  @moduledoc """
  Bootstrap4 button component.

  ## Examples
  ```
  <SurfaceBootstrap4.Button color="primary">
    Primary Button
  </SurfaceBootstrap4.Button>
  ```
  """

  use Surface.Component

  @doc "The label of the button"
  property label, :string

  @doc "Additional CSS classes"
  property class, :css_class

  @doc "The color of the button"
  property color, :string, values: ~w(primary secondary success info warning danger link)

  @doc "The size of button"
  property size, :string, values: ~w(sm md lg)

  @doc "Set the button as disabled preventing the user from interacting with the control"
  property disabled, :boolean

  @doc "Block level style"
  property block, :boolean

  @doc "Active style"
  property active, :boolean

  @doc "Triggered on click"
  property click, :event

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot(default)

  def render(assigns) do
    ~H"""
    <button
      type="button"
      :on-phx-click={{@click}}
      disabled={{@disabled}}
      class={{
        :btn,
        @class,
        "btn-#{@color}": @color,
        "btn-#{@size}": @size,
        "btn-block": @block,
        active: @active
      }}
    >
      <slot>{{ @label }}</slot>
    </button>
    """
  end
end
