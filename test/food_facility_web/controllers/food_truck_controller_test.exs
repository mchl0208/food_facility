defmodule FoodFacilityWeb.FoodTruckControllerTest do
  use FoodFacilityWeb.ConnCase, async: true

  describe "search food services" do
    test "Empty params returns all food services", %{conn: conn} do
      conn = get(conn, ~p"/api", %{})

      assert %{"data" => data} = json_response(conn, 200)
      assert Enum.count(data) == 3
    end

    test "Additional parameters without pattern match are ignored", %{conn: conn} do
      conn = get(conn, ~p"/api", %{"not_existing" => "params"})

      assert %{"data" => data} = json_response(conn, 200)
      assert Enum.count(data) == 3
    end

    test "Filter by distance returns food services within the radius", %{conn: conn} do
      conn = get(conn, ~p"/api", %{"from_location" => "37.74383117213268,-122.37779736896212,500"})

      assert %{"data" => data} = json_response(conn, 200)
      assert Enum.count(data) == 1
    end
  end
end
