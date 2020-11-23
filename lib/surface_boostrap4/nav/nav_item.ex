defmodule SurfaceBootstrap4.Nav.NavItem do
  @moduledoc """
  Bootstrap4 navigation item for the navigation component.
  """

  use Surface.Component

  @doc """
  The content of the generated navigation item.
  """
  slot default, required: true

  @doc "Additional CSS classes"
  prop class, :css_class

  def render(assigns) do
    ~H"""
    <li
      class={{
        "nav-item",
        @class
      }}
    >
      <slot/>
    </li>
    """
  end
end
