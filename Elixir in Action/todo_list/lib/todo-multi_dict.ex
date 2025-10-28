defmodule MultiDict do
  def new, do: Map.new()

  def add(dict, key, value) do
    Map.update(
      dict,
      key,
      [value],
      &[value | &1]
      # fn values -> [value | values] end
    )
  end

  def get(dict, key) do
    Map.get(dict, key, [])
  end
end
