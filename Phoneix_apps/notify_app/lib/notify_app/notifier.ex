defmodule NotifyApp.Notifier do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_init_state) do
    IO.puts("Notifier started.")
    {:ok, []}
  end

  def send_message(msg) do
    GenServer.cast(__MODULE__, {:send, msg})
  end

  def get_all do
    GenServer.call(__MODULE__, :get)
  end

  def crash do
    GenServer.cast(__MODULE__, :crash)
  end

  def handle_cast({:send, msg}, state) do
    new_state = [msg | state]
    IO.puts("Message received: #{msg}")
    {:noreply, new_state}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:crash, _state) do
    raise "Boom!"
  end
end
