# HttpClient

Make an http "GET" request to the specified url. The url should have
a specified protocol (http or https).

```
iex> import HttpClient
iex> url = URI.parse "http://example.com"
iex> HttpClient.get url
{:ok, 200, "..."}
```

Make an http "GET"request to the specified url using the given proxy.
The url should have a specified protocol (http or https).

```
iex> import HttpClient
iex> url = URI.parse "http://example.com"
iex> proxy = URI.parse "123.456.789.1:8080"
iex> HttpClient.get url, proxy
{:ok, 200, "..."}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `http_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:http_client, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/http_client](https://hexdocs.pm/http_client).

