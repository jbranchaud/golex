defmodule BoardFactory do
  def create(:blank, columns, rows) do
    Enum.map(1..rows, fn(_) ->
      Enum.map(1..columns, fn(_) -> Golex.dead_atom end)
    end)
  end

  def create(:random, columns, rows) do
    atoms = [Golex.dead_atom, Golex.live_atom]
    Enum.map(1..rows, fn(_) ->
      Enum.map(1..columns, fn(_) -> Enum.random(atoms) end)
    end)
  end
end
