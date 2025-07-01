defmodule HelloApiWeb.TaskController do
  use HelloApiWeb, :controller
  alias HelloApi.TaskStore
  def index(conn, _params) do
    tasks = TaskStore.all_tasks()
    json(conn, tasks)
  end

  def create(conn, %{"task" => task}) do
    TaskStore.add_task(task)
    json(conn, %{message: "Task added"})
  end

  def delete(conn, %{"id" => id}) do
    id = String.to_integer(id)
    TaskStore.delete_task(id)
    json(conn, %{message: "Task deleted"})
  end
end
