defmodule LogSewerBackend.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl Supervisor
  def init(_init_arg) do
    children = [
      {Finch, name: LogSewerBackend.Client}
    ]

    opts = [strategy: :one_for_one]
    Supervisor.init(children, opts)
  end
end
