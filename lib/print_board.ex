defmodule PrintBoard do
  def print(board), do: print(board, fetch_characters)
  def print(board,
   %{live_char: live_char,
     dead_char: dead_char,
     printable_live_char: printable_live_char,
     printable_dead_char: printable_dead_char
   }) do
    printable_board =
      Enum.map(board, fn(row) ->
        Enum.join(row)
      end)
      |> Enum.join("\n")
      |> String.replace(dead_char, printable_dead_char)
      |> String.replace(live_char, printable_live_char)
    printable_board <> "\n"
  end

  defp fetch_characters do
    %{
      live_char: Application.get_env(:golex, :internal_live_cell_character),
      dead_char: Application.get_env(:golex, :internal_dead_cell_character),
      printable_live_char: Application.get_env(:golex, :printable_live_cell_character),
      printable_dead_char: Application.get_env(:golex, :printable_dead_cell_character)
    }
  end
end
