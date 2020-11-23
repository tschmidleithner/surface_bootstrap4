defmodule SurfaceBootstrap4.Badge do
  @moduledoc """
  Bootstrap4 badge component.
  """

  use Surface.Component

  @doc "The label of the badge"
  prop label, :string

  @doc "Additional CSS classes"
  prop class, :css_class

  @doc "The color of the badge"
  prop color, :string, values: ~w(primary secondary success info warning danger link light dark)

  @doc "Badges more rounded with larger border-radius"
  prop pill, :boolean

  @doc "Triggered on click"
  prop click, :event

  @doc """
  The content of the generated `<span>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot(default)

  def render(assigns) do
    ~H"""
    <span
      :on-click={{@click}}
      class={{
        :badge,
        @class,
        "badge-pill": @pill,
        "badge-#{@color}": @color
      }}
    >
      <slot>{{ @label }}</slot>
    </span>
    """
  end
end
