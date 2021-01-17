defmodule SurfaceBootstrap4.BreadcrumbTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized
  doctest SurfaceBootstrap4.Breadcrumb

  alias SurfaceBootstrap4.Breadcrumb, warn: false
  alias SurfaceBootstrap4.Breadcrumb.BreadcrumbItem, warn: false
  alias Surface.Components.Link, warn: false
  import ComponentTestHelper

  test "creates a <nav> with <ol> of class breadcrumb and one active child" do
    expected = """
    <nav><ol class="breadcrumb"><li class="breadcrumb-item"><a href="/">Home</a></li><li class="breadcrumb-item active"><a href="/">Library</a></li></ol></nav>
    """

    assert_component(
      ~S(<Breadcrumb>
      <BreadcrumbItem>
        <Link to="/">Home</Link>
      </BreadcrumbItem>
      <BreadcrumbItem active>
        <Link to="/">Library</Link>
      </BreadcrumbItem>
    </Breadcrumb>),
      expected
    )
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
