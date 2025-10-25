defmodule CalculateTest do
  use ExUnit.Case
  doctest Calculate

  test "greets the world" do
    assert Calculate.hello() == :world
  end
end
