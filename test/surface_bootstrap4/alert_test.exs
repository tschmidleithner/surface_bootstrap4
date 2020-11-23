defmodule SurfaceBootstrap4.AlertTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.Alert, warn: false
  import ComponentTestHelper

  test "creates a <div> with class alert" do
    code = ~S(<Alert>alert</Alert>)

    expected = """
    <div class="alert">
      alert
    </div>
    """

    assert render_live(code) =~ expected
  end

  test "creates a <div> with class alert, alert-primary and additional CSS classes" do
    code = ~S(<Alert class={{ "p-3", "m-5" }} color="primary">With padding and margin</Alert>)

    expected = """
    <div class="alert p-3 m-5 alert-primary">
      With padding and margin
    </div>
    """

    assert render_live(code) =~ expected
  end

  test_with_params "prop color", &assert_regex/2 do
    [
      primary: {
        ~S(<Alert color="primary" />),
        ~r/class="(.*)alert-primary(.*)"/
      },
      secondary: {
        ~S(<Alert color="secondary" />),
        ~r/class="(.*)alert-secondary(.*)"/
      },
      success: {
        ~S(<Alert color="success" />),
        ~r/class="(.*)alert-success(.*)"/
      },
      info: {
        ~S(<Alert color="info" />),
        ~r/class="(.*)alert-info(.*)"/
      },
      warning: {
        ~S(<Alert color="warning" />),
        ~r/class="(.*)alert-warning(.*)"/
      },
      danger: {
        ~S(<Alert color="danger" />),
        ~r/class="(.*)alert-danger(.*)"/
      },
      light: {
        ~S(<Alert color="light" />),
        ~r/class="(.*)alert-light(.*)"/
      },
      dark: {
        ~S(<Alert color="dark" />),
        ~r/class="(.*)alert-dark(.*)"/
      }
    ]
  end

  defp assert_regex(component, expected_regex) do
    assert render_live(component) =~ expected_regex
  end
end
