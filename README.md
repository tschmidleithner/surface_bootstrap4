# SurfaceBootstrap4 (WIP)

A set of [Surface](https://github.com/msaraiva/surface/) components
based on [Bootstrap 4](https://getbootstrap.com/) for 
[Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view).

This project is heavily inspired by [surface_bulma](https://github.com/msaraiva/surface_bulma) 
which is implemented and maintained by the [author](https://github.com/msaraiva) of 
[Surface](https://github.com/msaraiva/surface/).

> **Note**: This is not a full-featured suite of components yet.

## Components
  
Currently, only the button component is supported. More components will be added 
soon. Contributions are welcome!
  
### Layout

  * [ ] Container
  * [ ] Container fluid
  
### Components

  * [ ] Alerts
  * [ ] Badge
  * [ ] Breadcrumb
  * [x] Buttons: with colors, sizes and states.
  * [ ] Button group
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
  * [ ] Navs
  * [ ] Navbar
  * [ ] Pagination
  * [ ] Popovers
  * [ ] Progress
  * [ ] Scrollspy
  * [ ] Spinners
  * [ ] Toasts
  * [ ] Tooltips

## Example

```jsx
<Button color="primary" size="lg">A large button</Button>
```

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

To get started quickly when using Bootstrap 4 CSS styles, you can use the Bootstrap CDN 
and add the following line to your `root.html.leex` in the DOM head:

```
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
```

## License

Copyright (c) 2020, Thomas Schmidleithner.

This code is licensed under the [MIT License](LICENSE.md).