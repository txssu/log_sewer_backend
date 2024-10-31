defmodule LogSewerBackend.Client do
  @moduledoc false

  def send_log(message, %LogSewerBackend{uri: uri, token: token, app_name: app_name}) do
    body = Jason.encode!(%{message: message, app_name: app_name})

    :post
    |> Finch.build(uri, headers(token), body)
    |> Finch.request(__MODULE__)
  end

  defp headers(token) do
    [
      {"Content-Type", "application/json"},
      {"x-log-sewer-token", token}
    ]
  end
end
