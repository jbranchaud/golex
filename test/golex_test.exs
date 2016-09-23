defmodule GolexTest do
  use ExUnit.Case
  doctest Golex

  test "step on an empty board" do
    board = [
      [:o, :o, :o],
      [:o, :o, :o],
      [:o, :o, :o]
    ]
    assert board == Golex.step(board)
  end

  test "step on stable board" do
    board = [
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o],
      [:o, :o, :x, :x, :o],
      [:o, :o, :x, :x, :o],
      [:o, :o, :o, :o, :o]
    ]
    assert board == Golex.step(board)
  end

  test "step on blinker" do
    board = [
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o],
      [:o, :x, :x, :x, :o],
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o]
    ]
    blinked_board = [
      [:o, :o, :o, :o, :o],
      [:o, :o, :x, :o, :o],
      [:o, :o, :x, :o, :o],
      [:o, :o, :x, :o, :o],
      [:o, :o, :o, :o, :o]
    ]
    assert blinked_board == Golex.step(board)
    assert board == Golex.step(Golex.step(board))
  end

  test "step on beacon" do
    board = [
      [:o, :o, :o, :o, :o, :o],
      [:o, :x, :x, :o, :o, :o],
      [:o, :x, :x, :o, :o, :o],
      [:o, :o, :o, :x, :x, :o],
      [:o, :o, :o, :x, :x, :o],
      [:o, :o, :o, :o, :o, :o]
    ]
    beaconed_board = [
      [:o, :o, :o, :o, :o, :o],
      [:o, :x, :x, :o, :o, :o],
      [:o, :x, :o, :o, :o, :o],
      [:o, :o, :o, :o, :x, :o],
      [:o, :o, :o, :x, :x, :o],
      [:o, :o, :o, :o, :o, :o]
    ]
    assert beaconed_board == Golex.step(board)
    assert board == Golex.step(beaconed_board)
  end

  test "step 6 times on a cross" do
    board = [
      [:o, :o, :o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o, :o, :o],
      [:o, :o, :o, :x, :o, :o, :o],
      [:o, :o, :x, :x, :x, :o, :o],
      [:o, :o, :o, :x, :o, :o, :o],
      [:o, :o, :o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o, :o, :o]
    ]
    four_blinkers = [
      [:o, :o, :x, :x, :x, :o, :o],
      [:o, :o, :o, :o, :o, :o, :o],
      [:x, :o, :o, :o, :o, :o, :x],
      [:x, :o, :o, :o, :o, :o, :x],
      [:x, :o, :o, :o, :o, :o, :x],
      [:o, :o, :o, :o, :o, :o, :o],
      [:o, :o, :x, :x, :x, :o, :o]
    ]
    assert four_blinkers == Golex.step(board, 6)
  end
end
