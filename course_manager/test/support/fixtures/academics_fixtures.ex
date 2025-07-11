defmodule CourseManager.AcademicsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CourseManager.Academics` context.
  """

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> CourseManager.Academics.create_course()

    course
  end
end
