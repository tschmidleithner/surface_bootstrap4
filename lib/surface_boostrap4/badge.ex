defmodule SurfaceBootstrap4.Badge do
  @moduledoc """
  Bootstrap4 badge component.
  """

  use Surface.Component

  @doc "The label of the badge"
  property label, :string

  @doc "Additional CSS classes"
  property class, :css_class

  @doc "The color of the badge"
  property color, :string, values: ~w(primary secondary success info warning danger link light dark)

  @doc "Badges more rounded with larger border-radius"
  property pill, :boolean

  @doc "Triggered on click"
  property click, :event

  @doc """
  The content of the generated `<span>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot(default)

  def render(assigns) do
    ~H"""
    <span
      :on-phx-click={{@click}}
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
