defmodule SurfaceBootstrap4.BadgeTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.Badge, warn: false
  import ComponentTestHelper

  test "creates a <span> with class badge" do
    expected = """
    <span class="badge ">
    A badge
    </span>
    """

    assert_component(~S(<Badge>A badge</Badge>), expected)
  end

  test "creates a <span> with class badge, badge-primary and additional CSS classes" do
    expected = """
    <span class="badge p-3 m-5 badge-primary">
    With padding and margin
    </span>
    """

    assert_component(~S(<Badge class={{ "p-3", "m-5"}} color="primary">With padding and margin</Badge>), expected)
  end

  test_with_params "property color", &render_and_assert_badge/2 do
    [
      primary: {
        ~S(<Badge color="primary">primary</Badge>),
        "primary"
      },
      secondary: {
        ~S(<Badge color="secondary">secondary</Badge>),
        "secondary"
      },
      success: {
        ~S(<Badge color="success">success</Badge>),
        "success"
      },
      info: {
        ~S(<Badge color="info">info</Badge>),
        "info"
      },
      warning: {
        ~S(<Badge color="warning">warning</Badge>),
        "warning"
      },
      danger: {
        ~S(<Badge color="danger">danger</Badge>),
        "danger"
      },
      link: {
        ~S(<Badge color="link">link</Badge>),
        "link"
      },
      light: {
        ~S(<Badge color="light">light</Badge>),
        "light"
      },
      dark: {
        ~S(<Badge color="dark">dark</Badge>),
        "dark"
      },
    ]
  end

  test_with_params "property pill", &assert_component/2 do
    [
      pill: {
        ~S(<Badge pill>pill</Badge>),
        """
        <span class="badge  badge-pill">
        pill
        </span>
        """
      },
      primary_pill: {
        ~S(<Badge color="primary" pill>primary pill</Badge>),
        """
        <span class="badge  badge-pill badge-primary">
        primary pill
        </span>
        """
      },
    ]
  end

  defp render_and_assert_badge(component, expected_color) do
    expected = """
    <span class="badge  badge-#{expected_color}">
    #{expected_color}
    </span>
    """

    assert render_live(component) =~ expected
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
