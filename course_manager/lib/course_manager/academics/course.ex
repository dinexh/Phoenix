defmodule CourseManager.Academics.Course do
  @derive {Jason.Encoder,
           only: [:id, :title, :description, :inserted_at, :updated_at]}
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :title, :string
    field :description, :string
    timestamps()
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
