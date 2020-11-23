defmodule SurfaceBootstrap4.Table do
  @moduledoc """
  Bootstrap4 table component.

  A table can be created by setting a source `data` to it and defining
  columns using the `SurfaceBootstrap4.Table.Column` component.
  """

  use Surface.Component

  @doc "The data that populates the table"
  prop data, :list, required: true

  @doc "Additional CSS classes"
  prop class, :css_class

  @doc "The size of the table"
  prop size, :string, values: ~w(sm md lg)

  @doc "Add borders to all the cells"
  prop bordered, :boolean, default: false

  @doc "Add borderless to all the cells"
  prop borderless, :boolean, default: false

  @doc "Add stripes to the table"
  prop striped, :boolean, default: false

  @doc "Add hovers to the table"
  prop hover, :boolean, default: false

  @doc "Invert colors of the table to dark background and light text"
  prop dark, :boolean, default: false

  @doc """
  A function that returns a class for the item's underlying `<tr>`
  element. The function receives the item and index related to
  the row.
  """
  prop rowClass, :fun

  @doc "The columns of the table"
  slot cols, props: [item: ^data], required: true

  def render(assigns) do
    ~H"""
    <table class={{
      :table,
      @class,
      "table-#{@size}": @size,
      "table-bordered": @bordered,
      "table-borderless": @borderless,
      "table-striped": @striped,
      "table-hover": @hover,
      "table-dark": @dark
    }}>
      <thead>
        <tr>
          <th :for={{ col <- @cols }}>
            {{ col.label }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          :for={{ {item, index} <- Enum.with_index(@data) }}
          class={{ row_class_fun(@rowClass).(item, index) }}>
          <td :for.index={{ index <- @cols }}>
            <span><slot name="cols" index={{ index }} :props={{ item: item }}/></span>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end

  defp row_class_fun(nil), do: fn _, _ -> "" end
  defp row_class_fun(rowClass), do: rowClass
end
