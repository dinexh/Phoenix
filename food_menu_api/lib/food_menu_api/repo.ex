defmodule FoodMenuApi.Repo do
  use Ecto.Repo,
    otp_app: :food_menu_api,
    adapter: Ecto.Adapters.Postgres
end
