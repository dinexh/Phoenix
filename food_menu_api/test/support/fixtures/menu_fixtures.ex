defmodule FoodMenuApi.MenuFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodMenuApi.Menu` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 42
      })
      |> FoodMenuApi.Menu.create_item()

    item
  end
end
