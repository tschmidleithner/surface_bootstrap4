defmodule SurfaceBootstrap4.ListGroup do
  @moduledoc """
  Bootstrap4 list group component.

  ## Examples
  ```
  <SurfaceBootstrap4.ListGroup>
    <SurfaceBootstrap4.ListGroup.ListGroupItem active>
      Cras justo odio
    </SurfaceBootstrap4.ListGroup.ListGroupItem>
    <SurfaceBootstrap4.ListGroup.ListGroupItem>
      Dapibus ac facilisis in
    </SurfaceBootstrap4.ListGroup.ListGroupItem>
    <SurfaceBootstrap4.ListGroup.ListGroupItem>
      Morbi leo risus
    </SurfaceBootstrap4.ListGroup.ListGroupItem>
  </SurfaceBootstrap4.ListGroup>
  ```
  """

  use Surface.Component

  @doc "Flush style"
  prop flush, :boolean

  @doc "Horizontal style"
  prop horizontal, :boolean

  @doc "Additional CSS classes"
  prop class, :css_class

  def render(assigns) do
    ~H"""
    <ul
      class={{
        @class,
        "list-group",
        "list-group-flush": @flush,
        "list-group-horizontal": @horizontal
      }}
    >
      <slot/>
    </ul>
    """
  end
end
