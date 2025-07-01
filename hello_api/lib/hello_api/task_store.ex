defmodule HelloApi.TaskStore do
  use Agent

  def start_link(_init) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def all_tasks do
    Agent.get(__MODULE__, & &1)
  end

  def add_task(task) do
    Agent.update(__MODULE__, fn state ->
      id = Map.size(state) + 1
      Map.put(state, id, task)
    end)
  end

  def delete_task(id) do
    Agent.update(__MODULE__, &Map.delete(&1, id))
  end
end
