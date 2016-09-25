defmodule PrintBoardTest do
  use ExUnit.Case

  setup do
    {:ok, [
      dead_char: "o",
      live_char: "x",
      printable_dead_char: "_",
      printable_live_char: "•"
    ]}
  end

  test "print a board with all dead cells", context do
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

    assert printed_board == PrintBoard.print(board, context)
  end

  test "print a board with some live cells", context do
    board = [
      [:o, :x, :o],
      [:x, :x, :x],
      [:o, :x, :o]
    ]
    printed_board = """
_•_
•••
_•_
"""

    assert printed_board == PrintBoard.print(board, context)
  end
end
