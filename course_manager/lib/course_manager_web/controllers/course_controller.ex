defmodule CourseManagerWeb.CourseController do
  use CourseManagerWeb, :controller
  alias CourseManager.Academics
  def index(conn , _params) do
    courses = Academics.list_courses()
    json(conn, courses)
  end
  def create(conn, %{"title" => t, "description" => d}) do
  case Academics.create_course(%{"title" => t, "description" => d}) do
    {:ok, course} ->
      # drop the __meta__ and other unwanted keys
      json(conn, Map.take(course, [:id, :title, :description, :inserted_at, :updated_at]))
    {:error, changeset} ->
      conn
      |> put_status(:unprocessable_entity)
      |> json(%{errors: changeset.errors})
  end
end
end
