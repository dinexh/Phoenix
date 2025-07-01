defmodule CourseManager.AcademicsTest do
  use CourseManager.DataCase

  alias CourseManager.Academics

  describe "courses" do
    alias CourseManager.Academics.Course

    import CourseManager.AcademicsFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Academics.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Academics.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Course{} = course} = Academics.create_course(valid_attrs)
      assert course.description == "some description"
      assert course.title == "some title"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Academics.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Course{} = course} = Academics.update_course(course, update_attrs)
      assert course.description == "some updated description"
      assert course.title == "some updated title"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Academics.update_course(course, @invalid_attrs)
      assert course == Academics.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Academics.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Academics.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Academics.change_course(course)
    end
  end
end
