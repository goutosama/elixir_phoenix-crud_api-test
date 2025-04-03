defmodule CrudApi.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CrudApi.Inventory` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> CrudApi.Inventory.create_item()

    item
  end
end
