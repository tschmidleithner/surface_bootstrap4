defmodule SurfaceBootstrap4.Progress do
  @moduledoc """
  Bootstrap4 progress component.

  ## Examples
  ```
  <SurfaceBootstrap4.Progress value=50 color="primary">50%</SurfaceBootstrap4.Progress>
  ```
  """

  use Surface.Component

  @doc "The label of the button"
  prop label, :string

  @doc "The value of the progress"
  prop value, :integer, default: 0

  @doc "Maximum value of the progress"
  prop max_value, :integer, default: 100

  @doc "Additional CSS classes for the outer progress div"
  prop class, :css_class

  @doc "Additional CSS classes for the inner bar div"
  prop bar_class, :css_class

  @doc "The color of the button"
  prop color, :string, values: ~w(primary secondary success info warning danger)

  @doc "Stripe style"
  prop striped, :boolean

  @doc "Animated style"
  prop animated, :boolean

  @doc """
  The content of the generated progress element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot(default)

  def render(assigns) do
    percent = assigns.value / assigns.max_value * 100

    ~H"""
    <div class={{
      :progress,
      @class
    }}>
      <div
        class={{
          "progress-bar",
          @bar_class,
          "bg-#{@color}": @color,
          "progress-bar-striped": @striped,
          "progress-bar-animated": @animated
        }}
        style="width: {{ percent }}%"
        role="progress-bar"
        aria-valuenow="{{ @value }}"
        aria-valuemin="0"
        aria-valuemax="{{ @max_value }}"
      >
        <slot>{{ @label }}</slot>
      </div>
    </div>
    """
  end
end
