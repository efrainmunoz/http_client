defmodule HttpClientTest do
  use ExUnit.Case
  doctest HttpClient

  test "make a request to the provided url" do
    {:ok, resp} =  HTTPoison.get("http://example.com")
    url = URI.parse("http://example.com")
    assert HttpClient.get(url) == {:ok, resp.status_code, resp.body}
    assert HttpClient.get("") == {:error, "Invalid url. Use %URI{} structs."}
  end

  test "make a request to the provided url witht he given proxy" do
    {:ok, resp} = HTTPoison.get("http://example.com")
    url = URI.parse("http://example.com")
    proxy = URI.parse(%URI{})
    assert HttpClient.get(url, proxy) == {:ok, resp.status_code, resp.body}
    assert HttpClient.get(url, "") == {:error, "Invalid url or proxy. Use %URI{} structs for both."}
  end
end
