defmodule BoardFactory do
  def create(:blank, columns, rows) do
    Enum.map(1..rows, fn(_) ->
      Enum.map(1..columns, fn(_) -> Golex.dead_atom end)
    end)
  end
end
