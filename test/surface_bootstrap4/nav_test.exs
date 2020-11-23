defmodule SurfaceBootstrap4.NavTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.Nav, warn: false
  alias SurfaceBootstrap4.Nav.NavItem, warn: false
  alias SurfaceBootstrap4.Nav.NavLink, warn: false
  import ComponentTestHelper

  test_with_params "nav variants", &assert_component/2 do
    [
      nav_default: {
        """
        <Nav>
          <NavItem>
            <NavLink to="/navigate">Navigation default</NavLink>
          </NavItem>
        </Nav>
        """,
        """
        <ul class="nav"><li class="nav-item"><a class="nav-link" href="/navigate">
          Navigation default
        </a></li></ul>
        """
      },
      nav_vertical: {
        ~S(<Nav vertical>Navigation vertical</Nav>),
        """
        <ul class="nav flex-column">
          Navigation vertical
        </ul>
        """
      },
      nav_tabs: {
        ~S(<Nav tabs>Navigation tabs</Nav>),
        """
        <ul class="nav nav-tabs">
          Navigation tabs
        </ul>
        """
      },
      nav_pills: {
        ~S(<Nav pills>Navigation pills</Nav>),
        """
        <ul class="nav nav-pills">
          Navigation pills
        </ul>
        """
      }
    ]
  end

  test_with_params "nav_link properties", &assert_component/2 do
    [
      active: {
        ~S(<NavLink to="/" active>Active link</NavLink>),
        """
        <a class="nav-link active" href="/">
          Active link
        </a>
        """
      },
      disabled: {
        ~S(<NavLink to="/" disabled>Disabled link</NavLink>),
        """
        <a class="nav-link disabled" href="/">
          Disabled link
        </a>
        """
      }
    ]
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
