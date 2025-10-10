defmodule SumList do
  @moduledoc """
  The `SumList` module provides a function to calculate the sum of all elements
  in a list of numbers.

  The sum is performed recursively, accumulating the result in an internal accumulator.

  ## Examples

      iex> SumList.call([1, 2, 3])
      6

      iex> SumList.call([])
      0
  """

  @doc """
  Takes a list of numbers and returns the sum of all elements.

  ## Examples

      iex> SumList.call([5, 10, 15])
      30

      iex> SumList.call([])
      0
  """
  def call(list), do: sum(list, 0)

  def call_enum_sum(list), do: Enum.sum(list)
  def call_enum_max(list), do: Enum.max(list)
  def call_enum_min(list), do: Enum.min(list)
  def call_enum_increment(list), do: Enum.map(list, fn elem -> elem + 1 end)
  def call_enum_more_than_five(list), do: Enum.any?(list, fn elem -> elem > 5 end)

  defp sum([], acc), do: acc

  defp sum([head | tail], acc) do
    acc = acc + head
    sum(tail, acc)
  end
end

# [1,2,3], 0

# 1 ex: [1,2,3] hd: 1, tail: [2,3], 0 -> acc = 0 + 1, sum([2,3], 1)
# 2 ex: [2,3] hd: 2, tail: [3], 1     -> acc 1 + 2, sum([3], 3)
# 3 ex: [3] hd: 3, tail: [], 3        -> acc 3 + 3, sum([], 3)
# 4 ex: [] hd: [], tail: [], 6      -> acc
