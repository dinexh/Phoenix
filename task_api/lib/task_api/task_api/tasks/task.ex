defmodule TaskApi.Tasks do
  alias TaskApi.Repo
  alias TaskApi.Tasks.Task

  defmodule Task do
    use Ecto.Schema
    import Ecto.Changeset

    schema "tasks" do
      field :title, :string
      field :completed, :boolean, default: false

      timestamps()
    end

    def changeset(task, attrs) do
      task
      |> cast(attrs, [:title, :completed])
      |> validate_required([:title, :completed])
    end
  end

  def list_tasks do
    Repo.all(Task)
  end

  def create_task(attrs) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def complete_task(id) do
    with %Task{} = task <- Repo.get(Task, id) do
      Task.changeset(task, %{completed: true})
      |> Repo.update()
    end
  end

end
