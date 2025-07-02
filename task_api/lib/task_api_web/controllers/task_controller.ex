defmodule TaskApiWeb.TaskController do
  use TaskApiWeb, :controller
  alias TaskApi.TaskQueue

  def index(conn, _params) do
    tasks = TaskQueue.list_tasks()
    json(conn, tasks)
  end

  def create(conn, %{"title" => title}) do
  TaskQueue.add_task(title)
  json(conn, %{message: "Task added"})
  end


  def delete(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    TaskQueue.complete_task(id)
    json(conn, %{message: "Task completed"})
  end

end
