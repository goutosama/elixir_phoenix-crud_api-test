defmodule CrudApiWeb.ItemControllerTest do
  use CrudApiWeb.ConnCase

  alias CrudApi.Inventory
  alias CrudApi.Inventory.Item

  @valid_attrs %{name: "Laptop", description: "MacBook Pro"}
  @update_attrs %{name: "Updated Laptop", description: "Updated description"}
  @invalid_attrs %{name: nil, description: nil}

  setup do
    {:ok, item} = Inventory.create_item(@valid_attrs)
    %{item: item}
  end

  test "GET /api/items возвращает список элементов", %{conn: conn} do
    conn = get(conn, Routes.item_path(conn, :index))
    assert json_response(conn, 200)["data"] != []
  end

  test "POST /api/items создает элемент при валидных данных", %{conn: conn} do
    conn = post(conn, Routes.item_path(conn, :create), item: @valid_attrs)
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get(conn, Routes.item_path(conn, :show, id))
    assert json_response(conn, 200)["data"]["name"] == "Laptop"
  end

  test "PUT /api/items/:id обновляет элемент", %{conn: conn, item: item} do
    conn = put(conn, Routes.item_path(conn, :update, item.id), item: @update_attrs)
    assert json_response(conn, 200)["data"]["name"] == "Updated Laptop"
  end

  test "DELETE /api/items/:id удаляет элемент", %{conn: conn, item: item} do
    conn = delete(conn, Routes.item_path(conn, :delete, item.id))
    assert response(conn, 204)
  end
end
