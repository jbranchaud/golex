defmodule BoardServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    board = BoardFactory.create(:random, 50, 50)
    PrintBoard.print(board)

    GenServer.cast(self(), :step)
    {:ok, %{board: board}}
  end

  defp schedule_next_step do
    Process.send_after(self(), {:"$gen_cast", :step}, 1000)
  end

  def handle_cast(:step, %{board: board}) do
    board = Golex.step(board)
    PrintBoard.print(board)
    schedule_next_step()
    {:noreply, %{board: board}}
  end
end
