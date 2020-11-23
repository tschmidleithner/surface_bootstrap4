defmodule SurfaceBootstrap4.ProgressTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.Progress, warn: false
  import ComponentTestHelper

  test "creates a <div> with class progress" do
    code = ~S(<Progress value=99>99%</Progress>)

    expected = """
    <div class="progress"><div class="progress-bar" style="width: 99.0%" role="progress-bar" aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">
        99%
      </div></div>
    """

    assert render_live(code) =~ expected
  end

  test "creates a <div> with class progress, bg-primary and additional CSS classes" do
    code = ~S(<Progress class={{ "p-3", "m-5" }}>With padding and margin</Progress>)

    expected = """
    <div class="progress p-3 m-5"><div class="progress-bar" style="width: 0.0%" role="progress-bar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
        With padding and margin
      </div></div>
    """

    assert render_live(code) =~ expected
  end

  test "creates a <div> with class progress and calculated percent based on max_value" do
    code = ~S(<Progress value=1 max_value=10>10%</Progress>)

    expected = """
    <div class="progress"><div class="progress-bar" style="width: 10.0%" role="progress-bar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="10">
        10%
      </div></div>
    """

    assert render_live(code) =~ expected
  end

  test_with_params "property color", &assert_regex/2 do
    [
      primary: {
        ~S(<Progress color="primary" />),
        ~r/class="(.*)bg-primary(.*)"/
      },
      secondary: {
        ~S(<Progress color="secondary" />),
        ~r/class="(.*)bg-secondary(.*)"/
      },
      success: {
        ~S(<Progress color="success" />),
        ~r/class="(.*)bg-success(.*)"/
      },
      info: {
        ~S(<Progress color="info" />),
        ~r/class="(.*)bg-info(.*)"/
      },
      warning: {
        ~S(<Progress color="warning" />),
        ~r/class="(.*)bg-warning(.*)"/
      },
      danger: {
        ~S(<Progress color="danger" />),
        ~r/class="(.*)bg-danger(.*)"/
      }
    ]
  end

  test_with_params "properties", &assert_regex/2 do
    [
      striped: {
        ~S(<Progress striped />),
        ~r/class="(.*)progress-bar-striped(.*)"/
      },
      animated: {
        ~S(<Progress animated />),
        ~r/class="(.*)progress-bar-animated(.*)"/
      },
      striped_animated: {
        ~S(<Progress striped animated />),
        ~r/class="(.*)progress-bar-striped progress-bar-animated(.*)"/
      }
    ]
  end

  defp assert_regex(component, expected_regex) do
    assert render_live(component) =~ expected_regex
  end
end
