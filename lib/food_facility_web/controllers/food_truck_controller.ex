defmodule FoodFacilityWeb.FoodTruckController do
  use FoodFacilityWeb, :controller

  action_fallback FoodFacilityWeb.FallbackController

  @socrata_provider Application.compile_env(:food_facility, :socrata_provider)

  @doc """
  Searches and lists all food trucks matching the given search param.

  if no param is provided all data is returned.

  Allowed params:
    - from_location: it can be your current lat/long or the place from where you want to get to the establishment.
  """
  def index(conn, params) do
    params = Map.to_list(params)

    with {:ok, foodtrucks} <- @socrata_provider.search(params) do
      conn
      |> put_status(:ok)
      |> render(:index, foodtrucks: foodtrucks)
    end
  end
end
