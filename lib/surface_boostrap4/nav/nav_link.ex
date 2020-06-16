defmodule SurfaceBootstrap4.Nav.NavLink do
  @moduledoc """
  Bootstrap4 navigation link for the navigation item component.
  """

  use Surface.Component

  @doc "Additional CSS classes"
  property class, :css_class

  @doc "Active style"
  property active, :boolean

  @doc "Set the navigation link as disabled"
  property disabled, :boolean

  @doc "Place to link to"
  property to, :string, required: true

  @doc "Triggered on click"
  property click, :event

  @doc """
  The label for the generated navigation link, if no content (default slot) is
  provided.
  """
  property label, :string

  def render(assigns) do
    ~H"""
    <Surface.Components.Link
      to={{@to}}
      click={{@click}}
      class={{
        "nav-link",
        @class,
        active: @active,
        disabled: @disabled,
      }}
    >
      <slot>{{ @label }}</slot>
    </Surface.Components.Link>
    """
  end
end
