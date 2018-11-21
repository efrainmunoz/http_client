defmodule HttpClient do
  @moduledoc """
  Documentation for HttpClient.
  """

  @doc """
  Make an http "GET" request to the specified url. The url should have
  a specified protocol (http or https).

  ```
  > import HttpClient
  > url = URI.parse "http://example.com"
  > HttpClient.get url
  {:ok, 200, "..."}
  ``` 

  """
  @spec get(URI.t) :: {:ok, String.t} | {:error, String.t}
  def get(%URI{} = url), do: get(url, %URI{})
  def get(_), do: {:error, "Invalid url. Use %URI{} structs."}
  
  @doc """
  Make an http "GET"request to the specified url using the given proxy. The url should have a specified protocol (http or https).

  ```
  > import HttpClient
  > url = URI.parse "http://example.com"
  > proxy = URI.parse "123.456.789.1:8080"
  > HttpClient.get url, proxy
  {:ok, 200, "..."}
  ```

  """
  @spec get(URI.t, URI.t) :: {:ok, String.t} | {:error, String.t}
  def get(%URI{} = url, %URI{} = proxy) do
    case url.host do
      nil ->
	{:error, "Invalid url or proxy. Use %URI{} structs for both."}
	
      _ ->
	headers = []
	options = [proxy: URI.to_string(proxy), hacknet: [:insecure]]

	url
        |> URI.to_string()
        |> HTTPoison.get(headers, options)
        |> response()
    end
  end
  def get(_, _), do: {:error, "Invalid url or proxy. Use %URI{} structs for both."}

  defp response({:ok, %HTTPoison.Response{} = resp}) do
    {:ok, resp.status_code, resp.body}
  end

  defp response({:error, %HTTPoison.Error{} = err}) do
    {:error, "HTTPoison error: #{inspect(err.reason)}"}
  end
end
