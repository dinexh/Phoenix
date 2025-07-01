defmodule CounterApp.CounterServer do
  use GenServer

  # Client API

  def start_link(_init_value) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def increment do
    GenServer.cast(__MODULE__, :increment)
  end

  def get_value do
    GenServer.call(__MODULE__, :get)
  end

  def crash do
    GenServer.cast(__MODULE__, :crash)
  end

  # Server Callbacks

  def init(initial_value) do
    IO.puts("[INIT] Counter started with #{initial_value}")
    {:ok, initial_value}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:increment, state) do
    {:noreply, state + 1}
  end

  def handle_cast(:crash, _state) do
    raise "Manual crash!"
  end
end
