defmodule SurfaceBootstrap4.ContainerTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias SurfaceBootstrap4.Container, warn: false
  alias SurfaceBootstrap4.Container.Row, warn: false
  alias SurfaceBootstrap4.Container.Col, warn: false
  import ComponentTestHelper

  test_with_params "container variants", &assert_component/2 do
    [
      container: {
        ~S(<Container>container</Container>),
        """
        <div class="container">
          container
        </div>
        """
      },
      container_fluid: {
        ~S(<Container fluid>fluid container</Container>),
        """
        <div class="container-fluid">
          fluid container
        </div>
        """
      }
    ]
  end

  test_with_params "container with rows and columns", &assert_component/2 do
    [
      container_with_rows: {
        """
        <Container>
          <Row>First row</Row>
          <Row no_gutters>Second row</Row>
          <Row>Third row</Row>
        </Container>
        """,
        """
        <div class="container"><div class="row">
          First row
        </div><div class="row no-gutters">
          Second row
        </div><div class="row">
          Third row
        </div></div>
        """
      },
      container_with_rows_and_cols: {
        """
        <Container>
          <Row>
            <Col size="6">
            First row, first col
            </Col>
            <Col size="12" xs="10" sm="8" md="6" lg="4" xl="2">
            First row, second col
            </Col>
          </Row>
          <Row no_gutters>
            <Col>
            Second row
            </Col>
          </Row>
        </Container>
        """,
        """
        <div class="container"><div class="row"><div class="col col-6">
            First row, first col
        </div><div class="col col-12 col-xs-10 col-sm-8 col-md-6 col-lg-4 col-xl-2">
            First row, second col
        </div></div><div class="row no-gutters"><div class="col">
            Second row
        </div></div></div>
        """
      }
    ]
  end

  defp assert_component(component, expected) do
    assert render_live(component) =~ expected
  end
end
