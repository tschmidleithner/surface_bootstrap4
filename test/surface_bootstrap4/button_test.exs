defmodule SurfaceBootstrap4.ButtonTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.Button, warn: false
  import ComponentTestHelper

  test "creates a <button> with type" do
    expected = """
    <button type="button" class="btn">
      Do something
    </button>
    """

    assert_component(~S(<Button>Do something</Button>), expected)
  end

  test "creates a primary <button> with additional CSS classes" do
    expected = """
    <button type="button" class="btn p-3 m-5 btn-primary">
      With padding and margin
    </button>
    """

    assert_component(
      ~S(<Button class={{ "p-3", "m-5" }} color="primary">With padding and margin</Button>),
      expected
    )
  end

  test "creates a <button> with value set" do
    expected = """
    <button type="button" value="sample-value" class="btn">
      Render value
    </button>
    """

    assert_component(~S(<Button value="sample-value">Render value</Button>), expected)
  end

  test_with_params "prop size", &assert_component/2 do
    [
      small: {
        ~S(<Button size="sm">small</Button>),
        """
        <button type="button" class="btn btn-sm">
          small
        </button>
        """
      },
      medium: {
        ~S(<Button size="md">medium</Button>),
        """
        <button type="button" class="btn btn-md">
          medium
        </button>
        """
      },
      large: {
        ~S(<Button size="lg">large</Button>),
        """
        <button type="button" class="btn btn-lg">
          large
        </button>
        """
      }
    ]
  end

  test_with_params "prop color", &assert_component/2 do
    [
      primary: {
        ~S(<Button color="primary">primary</Button>),
        """
        <button type="button" class="btn btn-primary">
          primary
        </button>
        """
      },
      secondary: {
        ~S(<Button color="secondary">secondary</Button>),
        """
        <button type="button" class="btn btn-secondary">
          secondary
        </button>
        """
      },
      success: {
        ~S(<Button color="success">success</Button>),
        """
        <button type="button" class="btn btn-success">
          success
        </button>
        """
      },
      info: {
        ~S(<Button color="info">info</Button>),
        """
        <button type="button" class="btn btn-info">
          info
        </button>
        """
      },
      warning: {
        ~S(<Button color="warning">warning</Button>),
        """
        <button type="button" class="btn btn-warning">
          warning
        </button>
        """
      },
      danger: {
        ~S(<Button color="danger">danger</Button>),
        """
        <button type="button" class="btn btn-danger">
          danger
        </button>
        """
      },
      link: {
        ~S(<Button color="link">link</Button>),
        """
        <button type="button" class="btn btn-link">
          link
        </button>
        """
      }
    ]
  end

  test_with_params "prop block", &assert_component/2 do
    [
      block_primary: {
        ~S(<Button color="primary" block>block primary</Button>),
        """
        <button type="button" class="btn btn-primary btn-block">
          block primary
        </button>
        """
      },
      block_secondary: {
        ~S(<Button color="secondary" block>block secondary</Button>),
        """
        <button type="button" class="btn btn-secondary btn-block">
          block secondary
        </button>
        """
      }
    ]
  end

  test_with_params "prop active", &assert_component/2 do
    [
      active: {
        ~S(<Button active>active</Button>),
        """
        <button type="button" class="btn active">
          active
        </button>
        """
      },
      primary_active: {
        ~S(<Button color="primary" active>primary active</Button>),
        """
        <button type="button" class="btn btn-primary active">
          primary active
        </button>
        """
      }
    ]
  end

  test_with_params "prop disabled", &assert_component/2 do
    [
      disabled: {
        ~S(<Button disabled>disabled</Button>),
        """
        <button type="button" disabled="disabled" class="btn">
          disabled
        </button>
        """
      },
      disabled_primary: {
        ~S(<Button color="primary" disabled>disabled primary</Button>),
        """
        <button type="button" disabled="disabled" class="btn btn-primary">
          disabled primary
        </button>
        """
      }
    ]
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
