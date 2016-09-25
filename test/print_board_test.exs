defmodule PrintBoardTest do
  use ExUnit.Case

  test "step on an empty board" do
    Application.put_env(:golex, :printable_dead_cell_character, "_")
    board = [
      [:o, :o, :o],
      [:o, :o, :o],
      [:o, :o, :o]
    ]
    printed_board = """
___
___
___
"""

    assert printed_board == PrintBoard.print(board)
  end
end
