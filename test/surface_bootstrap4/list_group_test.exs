defmodule SurfaceBootstrap4.ListGroupTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.ListGroup, warn: false
  alias SurfaceBootstrap4.ListGroup.ListGroupItem, warn: false
  import ComponentTestHelper

  test_with_params "list group variants", &assert_component/2 do
    [
      list_group_default: {
        """
        <ListGroup>
          <ListGroupItem>
          Cras justo odio
          </ListGroupItem>
          <ListGroupItem>
          Dapibus ac facilisis in
          </ListGroupItem>
        </ListGroup>
        """,
        """
        <ul class="list-group"><li class="list-group-item">
          Cras justo odio
        </li><li class="list-group-item">
          Dapibus ac facilisis in
        </li></ul>
        """
      },
      list_group_horizontal: {
        ~S(<ListGroup horizontal></ListGroup>),
        """
        <ul class="list-group list-group-horizontal"></ul>
        """
      }
    ]
  end

  test_with_params "list_group_item props", &assert_component/2 do
    [
      active: {
        ~S(<ListGroupItem active>Active</ListGroupItem>),
        """
        <li class="list-group-item active">
          Active
        </li>
        """
      },
      disabled: {
        ~S(<ListGroupItem disabled>Disabled</ListGroupItem>),
        """
        <li class="list-group-item disabled">
          Disabled
        </li>
        """
      }
    ]
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
