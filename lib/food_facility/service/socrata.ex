defmodule FoodFacility.Service.Socrata do
  defp get_config(key, default \\ nil),
    do: Application.get_env(:food_facility, __MODULE__, []) |> Keyword.get(key, default)

  def request(method, route, payload \\ %{}, opts \\ []) do
    caller = get_config(:api_caller, &FoodFacility.Service.Socrata.call_api/4)

    caller.(method, route, payload, opts)
  end

  def call_api(method, route, payload, opts) do
    request_url = get_config(:base_url) <> route

    case send_request(method, request_url, payload, opts) do
      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
        extract_response(status_code, body)

      {:error, error} ->
        {:error, error}
    end
  end

  defp extract_response(status_code, body) when status_code < 300, do: {:ok, Jason.decode!(body)}

  defp extract_response(status_code, body) do
    error =
      case Jason.decode(body) do
        {:ok, b} -> b
        _ -> body
      end

    {:error, status_code, error}
  end

  defp send_request(:get, url, _payload, opts) do
    HTTPoison.get(url, build_headers(opts), recv_timout: 15_000)
  end

  defp send_request(method, url, payload, opts) do
    apply(HTTPoison, method, [
      url,
      Jason.encode!(payload),
      build_headers(opts),
      [recv_timout: 15_000]
    ])
  end


  defp build_headers(opts) do
    [
      {"Content-type", Keyword.get(opts, :content_type, "application/json")}
    ]
  end

  def search(params \\ nil) do
    request(:get, "rqzj-sfat.json", params, [])
  end
end
