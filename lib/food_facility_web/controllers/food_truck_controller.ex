defmodule FoodFacilityWeb.FoodTruckController do
  use FoodFacilityWeb, :controller

  action_fallback FoodFacilityWeb.FallbackController

  def index(conn, _params) do
    qry_result =
      query("rqzj-sfat", domain: "data.sfgov.org")
      |> select([:objectid, :applicant])
      # |> where("")
      # |> order("")
      |> offset(5)
      |> run

    with {:ok, row_stream} <- qry_result do
      foodtrucks =
        Enum.take(row_stream, 10)
        |> Enum.map(&(&1))

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
