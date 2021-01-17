defmodule SurfaceBootstrap4.Breadcrumb.BreadcrumbItem do
  @moduledoc """
  Bootstrap4 breadcrumb item for the breadcrumb component.
  """

  use Surface.Component

  @doc """
  The content of the generated breadcrumb item.
  """
  slot default, required: true

  @doc "Active style"
  prop active, :boolean

  @doc "Additional CSS classes"
  prop class, :css_class

  def render(assigns) do
    ~H"""
    <li
      class={{
        @class,
        "breadcrumb-item",
        active: @active
      }}
    >
      <slot/>
    </li>
    """
  end
end
