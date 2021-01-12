defmodule SurfaceBootstrap4.ButtonGroupTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.ButtonGroup, warn: false
  alias SurfaceBootstrap4.Button, warn: false
  import ComponentTestHelper

  test_with_params "button_group variants", &assert_component/2 do
    [
      button_group_default: {
        """
        <ButtonGroup>
          <Button color="secondary">
            Left
          </Button>
          <Button color="secondary">
            Middle
          </Button>
          <Button color="secondary">
            Right
          </Button>
        </ButtonGroup>
        """,
        """
        <div class="btn-group"><button type="button" class="btn btn-secondary">
            Left
        </button><button type="button" class="btn btn-secondary">
            Middle
        </button><button type="button" class="btn btn-secondary">
            Right
        </button></div>
        """
      },
      button_group_vertical: {
        ~S(<ButtonGroup vertical>Vertically stacked</ButtonGroup>),
        """
        <div class="btn-group-vertical">
          Vertically stacked
        </div>
        """
      }
    ]
  end

  test_with_params "button_group size", &assert_component/2 do
    [
      sm: {
        ~S(<ButtonGroup size="sm"><Button>Small</Button></ButtonGroup>),
        """
        <div class="btn-group btn-group-sm"><button type="button" class="btn">
          Small
        </button></div>
        """
      },
      md: {
        ~S(<ButtonGroup size="md"><Button>Medium</Button></ButtonGroup>),
        """
        <div class="btn-group btn-group-md"><button type="button" class="btn">
          Medium
        </button></div>
        """
      },
      lg: {
        ~S(<ButtonGroup size="lg"><Button>Large</Button></ButtonGroup>),
        """
        <div class="btn-group btn-group-lg"><button type="button" class="btn">
          Large
        </button></div>
        """
      },
    ]
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
