# This would be main context for the counter application
defmodule CounterApp.Counter do
  use GenServer
  alias CounterApp.Repo
  alias CounterApp.Counter.Counter

  # Now we will start the GenServer
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  # now we will declare the apis for the GenServer
  def get(), do: GenServer.call(__MODULE__, :get)
  def inc(), do: GenServer.cast(__MODULE__, :increment)
  def dec(), do: GenServer.cast(__MODULE__, :decrement)
  def reset(), do: GenServer.cast(__MODULE__, :reset)

  # now we will write all the callbacks for the GenServer
  def init(_) do
    counter = Repo.one(Counter) || Repo.insert!(%Counter{})
    {:ok, counter}
  end

  def handle_call(:get, _from, counter), do: {:reply, counter.value, counter}

  def handle_cast(:increment, counter) do
    new_value = counter.value + 1
    {:ok, updated} = update_counter(counter, new_value)
    {:noreply, updated}
  end

  def handle_cast(:decrement, counter) do
    new_value = counter.value - 1
    {:ok, updated} = update_counter(counter, new_value)
    {:noreply, updated}
  end

  def handle_cast(:reset, counter) do
    {:ok, updated} = update_counter(counter, 0)
    {:noreply, updated}
  end

  defp update_counter(counter, value) do
    changeset = Counter.changeset(counter, %{value: value})
    Repo.update(changeset)
  end
end
