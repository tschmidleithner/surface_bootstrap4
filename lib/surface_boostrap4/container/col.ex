defmodule SurfaceBootstrap4.Container.Col do
  @moduledoc """
  Bootstrap4 col for the containers row component.
  """

  use Surface.Component

  @doc "The size of column"
  property(size, :integer)

  @doc "Responsive behaviour for xs of the column"
  property(xs, :integer)

  @doc "Responsive behaviour for sm of the column"
  property(sm, :integer)

  @doc "Responsive behaviour for md of the column"
  property(md, :integer)

  @doc "Responsive behaviour for lg of the column"
  property(lg, :integer)

  @doc "Responsive behaviour for xl of the column"
  property(xl, :integer)

  @doc """
  The content of the generated column.
  """
  slot(default, required: true)

  def render(assigns) do
    ~H"""
    <div
      class={{
        "col",
        "col-#{@size}": @size,
        "col-xs-#{@xs}": @xs,
        "col-sm-#{@sm}": @sm,
        "col-md-#{@md}": @md,
        "col-lg-#{@lg}": @lg,
        "col-xl-#{@xl}": @xl,
      }}
    >
      <slot></slot>
    </div>
    """
  end
end
