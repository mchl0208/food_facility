defmodule FoodFacilityWeb.FoodTruckController do
  use FoodFacilityWeb, :controller

  action_fallback FoodFacilityWeb.FallbackController

  @socrata_provider Application.compile_env(:food_facility, :socrata_provider)

  def index(conn, _params) do
    with {:ok, foodtrucks} <- @socrata_provider.search() do
      conn
      |> put_status(:ok)
      |> render(:index, foodtrucks: foodtrucks)
    end
  end

  @doc """
  Searches and lists all food trucks matching the given search param (`term`).
  """
  def search(conn, params) do
    res = params

    conn
    |> put_status(:ok)
    |> render(:index, foodtrucks: res)
  end
end
