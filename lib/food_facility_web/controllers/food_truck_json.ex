defmodule FoodFacilityWeb.FoodTruckJSON do
  @doc """
  Renders a list of food trucks.
  """
  def index(%{foodtrucks: foodtrucks}) do
    %{data: for(foodtruck <- foodtrucks, do: data(foodtruck))}
  end

  @doc """
  Renders a single food truck.
  """
  def show(%{foodtruck: foodtruck}) do
    %{data: data(foodtruck)}
  end

  defp data(%{} = foodtruck) do
    %{
      id: Map.get(foodtruck, "objectid"),
      facilitytype: Map.get(foodtruck, "facilitytype"),
      fooditems: Map.get(foodtruck, "fooditems"),
      status: Map.get(foodtruck, "status"),
      address: Map.get(foodtruck, "address")
    }
  end
end
