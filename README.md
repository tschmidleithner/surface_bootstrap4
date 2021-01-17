# SurfaceBootstrap4 (WIP)

![Elixir CI](https://github.com/tschmidleithner/surface_bootstrap4/workflows/Elixir%20CI/badge.svg)

A set of [Surface](https://github.com/msaraiva/surface/) components
based on [Bootstrap 4](https://getbootstrap.com/) for 
[Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view).

This project is heavily inspired by [surface_bulma](https://github.com/msaraiva/surface_bulma) 
which is implemented and maintained by the [author](https://github.com/msaraiva) of 
[Surface](https://github.com/msaraiva/surface/).

> **Note**: This is not a full-featured suite of components yet.

## Components
  
More components will be added soon. Contributions are welcome!
  
### Layout

  * [x] Container (with fluid support + Row, Col)
  
### Components

  * [x] Alerts (colors, closeable)
  * [x] Badge
  * [x] Breadcrumb
  * [x] Buttons (colors, sizes and states)
  * [x] Button group
  * [ ] Card
  * [ ] Carousel
  * [ ] Collapse
  * [ ] Dropdowns
  * [ ] Forms
  * [ ] Input group
  * [ ] Jumbotron
  * [ ] List group
  * [ ] Media object
  * [ ] Modal
  * [x] Navs (Nav, NavItem, NavLink)
  * [ ] Navbar
  * [ ] Pagination
  * [ ] Popovers
  * [x] Progress (colors, animated and striped)
  * [ ] Scrollspy
  * [ ] Spinners
  * [x] Tables (striped, bordered, borderless, hoverable, dark)
  * [ ] Toasts
  * [ ] Tooltips

## Example

```jsx
<Container fluid>
  <Row>
    <Col>
      <Badge color="light">Light badge</Badge>
      <Badge color="dark" pill>Dark pill badge</Badge>
    </Col>
  </Row>

  <Row>
    <Col>
      <Button color="primary" size="lg">A large button</Button>
    </Col>
    <Col>
      <Button color="secondary" block>A block button</Button>
      <Button color="info" class={{"p-5", "m-3"}}>Button with custom/additional CSS classes</Button>
    </Col>
  </Row>

  <Row>
    <Col><Alert color="primary">A primary alert</Alert></Col>
  </Row>

  <Row>
    <Col>
      <Progress value=50 animated striped>50%</Progress>
    </Col>
  </Row>

  <Row no_gutters>
    <Col md="10" lg="6" xl="4">
      <Nav pills>
        <NavItem>
          <NavLink to="/" active>Active</NavLink>
          <NavLink to="/sample">Sample</NavLink>
          <NavLink to="/" disabled>Disabled</NavLink>
        </NavItem>
      </Nav>
    </Col>
  </Row>
</Container>
```

More examples can be found in the [demo application](https://github.com/tschmidleithner/surface_bootstrap4_demo).

## Usage

Add `surface_bootstrap4` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    ...
    {:surface_bootstrap4, github: "tschmidleithner/surface_bootstrap4"}
  ]
end
```

To use Surface on plain Phoenix views with `~H` support, add the following import to your web file in `lib/my_app_web.ex`:

```elixir
# lib/my_app_web.ex

...

def view do
  quote do
    ...
    import Surface
  end
end
```

You will also need to call `Surface.init/1` in the mount function:

```elixir
defmodule PageLive do
  use Phoenix.LiveView

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = Surface.init(socket)
    # ...
    {:ok, socket}
  end

  ...
end
```

```elixir
defmodule NavComponent do
  use Phoenix.LiveComponent

  @impl Phoenix.LiveComponent
  def mount(socket) do
    socket = Surface.init(socket)
    # ...
    {:ok, socket}
  end

  ...
end
```

To get started quickly when using Bootstrap 4 CSS styles, you can use the Bootstrap CDN 
and add the following line to your `root.html.leex` in the DOM head:

```
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
```

## License

Copyright (c) 2020, Thomas Schmidleithner.

This code is licensed under the [MIT License](LICENSE.md).
