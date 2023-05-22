defmodule FoodFacility.Test.FakeSocrata do
  def call_api(method, path, payload, opts),
    do: build_response(method, String.split(path, "/"), payload, opts)

  def build_response(:get, ["rqzj-sfat.json"], payload, _opts) do
    cond do
      payload == "" -> build_response(:get, nil)
      String.match?(payload, ~r/within_circle/) -> build_response(:get, :within_circle)
    end
  end

  def build_response(:get, nil) do
    {:ok,[
      %{
        id: "UUID1",
        facilitytype: "Truck",
        fooditems: "Cold Truck: Corn Dogs: Noodle Soups",
        status: "APPROVED",
        address: "79 NEW MONTGOMERY ST"
      },
      %{
        id: "UUID2",
        facilitytype: "Truck",
        fooditems: "Cold Truck: Corn Dogs: Noodle Soups",
        status: "APPROVED",
        address: "79 NEW MONTGOMERY ST"
      },
      %{
        id: "UUID3",
        facilitytype: "Truck",
        fooditems: "Cold Truck: Corn Dogs: Noodle Soups",
        status: "APPROVED",
        address: "79 NEW MONTGOMERY ST"
      }
    ]}
  end

  def build_response(:get, :within_circle) do
    {:ok,[
      %{
        id: "UUID1",
        facilitytype: "Truck",
        fooditems: "Cold Truck: Corn Dogs: Noodle Soups",
        status: "APPROVED",
        address: "79 NEW MONTGOMERY ST"
      }
    ]}
  end
end
