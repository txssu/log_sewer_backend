defmodule LogSewerBackendTest do
  use ExUnit.Case
  doctest LogSewerBackend

  test "greets the world" do
    assert LogSewerBackend.hello() == :world
  end
end
