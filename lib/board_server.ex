defmodule BoardServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    board = BoardFactory.create(:random, 10, 10)
    PrintBoard.print(board)
    {:ok, %{board: board}}
  end

  def step(pid) do
    GenServer.call(pid, :step)
  end

  def handle_call(:step, _from, %{board: board}) do
    board = Golex.step(board)
    PrintBoard.print(board)
    {:reply, :ok, %{board: board}}
  end
end
