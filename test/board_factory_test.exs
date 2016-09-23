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
end
