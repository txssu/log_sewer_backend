defmodule LogSewerBackend do
  @moduledoc false
  @behaviour :gen_event

  alias LogSewerBackend.Client

  defstruct uri: nil, token: nil, app_name: nil

  @impl :gen_event
  def init(_opts) do
    options = Application.get_env(:logger, __MODULE__)

    {:ok, configure(options)}
  end

  @impl :gen_event
  def handle_call({:configure, options}, _old_options) do
    {:ok, :ok, configure(options)}
  end

  defp configure(options) do
    %__MODULE__{
      uri: fetch_option!(options, :uri),
      token: fetch_option!(options, :token),
      app_name: fetch_option!(options, :app_name)
    }
  end

  @impl :gen_event
  def handle_event({:error, _group_leader, {Logger, message, _datetime, _metadata}}, options) do
    Client.send_log(IO.iodata_to_binary(message), options)

    {:ok, options}
  end

  def handle_event(_data, options) do
    {:ok, options}
  end

  defp fetch_option!(options, key) do
    options[key] ||
      raise """
      Missing required configuration: #{inspect(key)}
      """
  end
end
