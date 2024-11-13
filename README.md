# LogSewerBackend

## Installation

The package can be installed by adding `log_sewer_backend` to your list of 
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:log_sewer_backend, "~> 0.0.0"},
    {:logger_backends, "~> 1.0"}
  ]
end
```


## Usage

```elixir
{:ok, _pid} = LoggerBackends.add(LogSewerBackend)
```

## Configuration

```elixir
config :logger, LogSewerBackend,
  uri: "http://localhost:4000/api/logs",
  token: "SECRET_TOKEN",
  app_name: :sewer_usage_example
```
