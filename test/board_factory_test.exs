defmodule BoardFactoryTest do
  use ExUnit.Case
  doctest BoardFactory

  test "create a blank 5x5 board" do
    expected_board = [
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o],
      [:o, :o, :o, :o, :o]
    ]
    assert expected_board == BoardFactory.create(:blank, 5, 5)
  end

  test "create a blank 2x4 board" do
    expected_board = [
      [:o, :o],
      [:o, :o],
      [:o, :o],
      [:o, :o]
    ]
    assert expected_board == BoardFactory.create(:blank, 2, 4)
  end

  test "create a random 5x4 board" do
    random_board = BoardFactory.create(:random, 5, 4)
    assert length(random_board) == 4
    assert length(hd(random_board)) == 5
  end

  test "create a random 4x4 board" do
    expected_board = [
      [:x, :x, :o, :o],
      [:x, :x, :x, :x],
      [:o, :x, :o, :o],
      [:x, :o, :o, :o]
    ]
    :rand.seed(:exsplus, {1,2,3})
    assert expected_board == BoardFactory.create(:random, 4, 4)
  end
end
