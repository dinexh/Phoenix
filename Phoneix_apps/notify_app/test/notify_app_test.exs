defmodule NotifyAppTest do
  use ExUnit.Case
  doctest NotifyApp

  test "greets the world" do
    assert NotifyApp.hello() == :world
  end
end
