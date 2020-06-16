defmodule SurfaceBootstrap4.Nav do
  @moduledoc """
  Bootstrap4 navigation component to further wrap children such as
  `SurfaceBootstrap4.Nav.NavItem` and `SurfaceBootstrap4.Nav.NavLink`.

  ## Examples
  ```
  <SurfaceBootstrap4.Nav>
    <SurfaceBootstrap4.NavItem>
      <SurfaceBootstrap4.NavLink to="/navigate">Navigation item</SurfaceBootstrap4.NavLink>
    </SurfaceBootstrap4.NavItem>
  </SurfaceBootstrap4.Nav>
  ```
  """

  use Surface.Component

  @doc "Vertical stack navigation"
  property vertical, :boolean

  @doc "Tabbed navigation"
  property tabs, :boolean

  @doc "Navigation with pills"
  property pills, :boolean

  @doc "Additional CSS classes"
  property class, :css_class

  def render(assigns) do
    ~H"""
    <ul
      class={{
        :nav,
        @class,
        "flex-column": @vertical,
        "nav-tabs": @tabs,
        "nav-pills": @pills
      }}
    >
      <slot/>
    </ul>
    """
  end
end
