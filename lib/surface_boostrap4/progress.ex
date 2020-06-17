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
  property label, :string

  @doc "The value of the progress"
  property value, :integer, default: 0

  @doc "Maximum value of the progress"
  property max_value, :integer, default: 100

  @doc "Additional CSS classes for the outer progress div"
  property class, :css_class

  @doc "Additional CSS classes for the inner bar div"
  property bar_class, :css_class

  @doc "The color of the button"
  property color, :string, values: ~w(primary secondary success info warning danger)

  @doc "Stripe style"
  property striped, :boolean

  @doc "Animated style"
  property animated, :boolean

  @doc "The percent value of the progress bar depending on value and max_value"
  context set percent, :decimal

  @doc """
  The content of the generated progress element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot(default)

  def init_context(assigns) do
    percent = (assigns.value / assigns.max_value) * 100
    {:ok, percent: percent}
  end

  def render(assigns) do
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
          "progress-bar-animated": @animated,
        }}
        style="width: {{ @percent }}%"
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
