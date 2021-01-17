defmodule SurfaceBootstrap4.Breadcrumb do
  @moduledoc """
  Bootstrap4 breadcrumb component.

  ## Examples
  ```
  <SurfaceBootstrap4.Breadcrumb>
    <SurfaceBootstrap4.Breadcrumb.BreadcrumbItem>
      <Surface.Components.Link to="/">Home</Surface.Components.Link>
    </SurfaceBootstrap4.Breadcrumb.BreadcrumbItem>
    <SurfaceBootstrap4.Breadcrumb.BreadcrumbItem>
      <Surface.Components.Link to="/library" active>Library</Surface.Components.Link>
    </SurfaceBootstrap4.Breadcrumb.BreadcrumbItem>
  </SurfaceBootstrap4.Breadcrumb>
  ```
  """

  use Surface.Component

  @doc "Additional CSS classes"
  prop class, :css_class

  def render(assigns) do
    ~H"""
    <nav>
      <ol
        class={{
          @class,
          :breadcrumb
        }}
      >
        <slot/>
      </ol>
    </nav>
    """
  end
end
