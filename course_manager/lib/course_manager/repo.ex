defmodule CourseManager.Repo do
  use Ecto.Repo,
    otp_app: :course_manager,
    adapter: Ecto.Adapters.Postgres
end
