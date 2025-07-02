defmodule TaskApi.TaskQueue do
  use GenServer
  alias TaskApi.Tasks  # 👈 You need this!
  alias TaskApi.Tasks.Task

  # Public API
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def list_tasks, do: GenServer.call(__MODULE__, :list)
  def add_task(title), do: GenServer.cast(__MODULE__, {:add, title})
  def complete_task(id), do: GenServer.cast(__MODULE__, {:complete, id})

  # Init: Load all tasks from DB
  def init(_) do
    IO.puts("Loading the tasks from the database")
    {:ok, Tasks.list_tasks()}
  end

  # List tasks
  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  # Add task: Save to DB + store in memory
  def handle_cast({:add, title}, state) do
    attrs = %{title: title, completed: false}

    case Tasks.create_task(attrs) do
      {:ok, task} ->
        {:noreply, [task | state]}

      {:error, changeset} ->
        IO.inspect(changeset.errors, label: "Failed to insert task")
        {:noreply, state}
    end
  end

  # Complete task: Update DB + remove from memory
  def handle_cast({:complete, id}, state) do
    Tasks.complete_task(id)

    new_state = Enum.reject(state, fn t -> t.id == id end)
    {:noreply, new_state}
  end
end
