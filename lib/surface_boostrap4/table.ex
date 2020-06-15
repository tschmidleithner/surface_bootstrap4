defmodule SurfaceBootstrap4.Table do
  @moduledoc """
  Bootstrap4 table component.

  A table can be created by setting a source `data` to it and defining
  columns using the `SurfaceBootstrap4.Table.Column` component.
  """

  use Surface.Component

  @doc "The data that populates the table"
  property data, :list, required: true

  @doc "The size of the table"
  property size, :string, values: ~w(sm md lg)

  @doc "Add borders to all the cells"
  property bordered, :boolean, default: false

  @doc "Add borderless to all the cells"
  property borderless, :boolean, default: false

  @doc "Add stripes to the table"
  property striped, :boolean, default: false

  @doc "Add hovers to the table"
  property hover, :boolean, default: false

  @doc "Invert colors of the table to dark background and light text"
  property dark, :boolean, default: false

  @doc """
  A function that returns a class for the item's underlying `<tr>`
  element. The function receives the item and index related to
  the row.
  """
  property rowClass, :fun

  @doc "The columns of the table"
  slot cols, props: [item: ^data], required: true

  def render(assigns) do
    ~H"""
    <table class={{
      :table,
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
          <td :for={{ col <- @cols }}>
            <span>{{ col.inner_content.(item: item) }}</span>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end

  defp row_class_fun(nil), do: fn _, _ -> "" end
  defp row_class_fun(rowClass), do: rowClass
end
