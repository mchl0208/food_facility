defmodule FoodFacilityWeb.ErrorJSONTest do
  use FoodFacilityWeb.ConnCase, async: true

  test "renders 404" do
    assert FoodFacilityWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FoodFacilityWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
