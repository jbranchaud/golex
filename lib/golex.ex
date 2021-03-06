defmodule Golex do
  # Game Of Life

  @live :x
  @dead :o
  def live_atom, do: @live
  def dead_atom, do: @dead

  def step(board) do
    for row <- 0..(length(board) - 1) do
      for column <- 0..(length(hd(board)) - 1) do
        update_cell(%{
          row: row,
          column: column,
          board: board
        })
      end
    end
  end

  def step(board, 0), do: board
  def step(board, steps) do
    new_board = step(board)
    step(new_board, steps - 1)
  end

  defp update_cell(cell) do
    live_count = count_live_neighbors(cell)
    status = fetch_status(cell)
    apply_rules(live_count, status)
  end

  # 1. Any live cell with fewer than two live neighbors dies
  # 2. Any live cell with two or three live neighbors lives
  # 3. Any live cell with more than three live neighbors dies
  # 4. Any dead cell with exactly three live neighbors becomes a live cell
  defp apply_rules(live_count, status) do
    case {live_count, status} do
      {count, @live} when count < 2 -> @dead
      {count, @live} when count > 3 -> @dead
      {3    , @dead}                -> @live
      _                             -> status
    end
  end

  defp count_live_neighbors(%{row: row, column: column, board: board}) do
    [
      {row - 1, column - 1},
      {row    , column - 1},
      {row + 1, column - 1},
      {row - 1, column    },
      {row + 1, column    },
      {row - 1, column + 1},
      {row    , column + 1},
      {row + 1, column + 1}
    ]
    |> Enum.count(&(is_live(&1, board)))
  end

  defp is_live({-1, _}, _board), do: false
  defp is_live({_, -1}, _board), do: false
  defp is_live({a, _b}, board) when a >= length(board), do: false
  defp is_live({_a, b}, board) when b >= length(hd(board)), do: false
  defp is_live({a, b}, board) do
    fetch_status(%{
      row: a,
      column: b,
      board: board
    }) == @live
  end

  defp fetch_status(%{row: row, column: column, board: board}) do
    board
    |> Enum.fetch!(row)
    |> Enum.fetch!(column)
  end
end
