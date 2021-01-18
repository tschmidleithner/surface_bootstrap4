defmodule SurfaceBootstrap4.ListGroup.ListGroupItem do
  @moduledoc """
  Bootstrap4 list group item for the list group component.
  """

  use Surface.Component

  @doc """
  The content of the generated list group item.
  """
  slot default, required: true

  @doc "Active style"
  prop active, :boolean

  @doc "Disabled style"
  prop disabled, :boolean

  @doc "Additional CSS classes"
  prop class, :css_class

  def render(assigns) do
    ~H"""
    <li
      class={{
        @class,
        "list-group-item",
        active: @active,
        disabled: @disabled
      }}
    >
      <slot/>
    </li>
    """
  end
end
