defmodule Recursion do
  # checkIsTenOrMore
  def checkIsTenOrMore(value) do
    if value >= 10 do
      value
    else
      value = value + 1

      unless value >= 10 do
        IO.puts(value)
      end

      checkIsTenOrMore(value)
    end
  end

  # SumList
  def sumList(list), do: execSum(list, 0)

  defp execSum([], acc), do: acc

  defp execSum([head | tail], acc) do
    acc = acc + head
    execSum(tail, acc)
  end
end
