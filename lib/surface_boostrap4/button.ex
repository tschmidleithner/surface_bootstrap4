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
  prop label, :string

  @doc "Additional CSS classes"
  prop class, :css_class

  @doc "The color of the button"
  prop color, :string, values: ~w(primary secondary success info warning danger link)

  @doc "The size of button"
  prop size, :string, values: ~w(sm md lg)

  @doc "Set the button as disabled preventing the user from interacting with the control"
  prop disabled, :boolean

  @doc "Block level style"
  prop block, :boolean

  @doc "Active style"
  prop active, :boolean

  @doc "Triggered on click"
  prop click, :event

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot(default)

  def render(assigns) do
    ~H"""
    <button
      type="button"
      :on-click={{@click}}
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
