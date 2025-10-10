defmodule Recursion do
  # check_is_ten_or_more
  def check_is_ten_or_more(value) do
    if value >= 10 do
      value
    else
      value = value + 1

      unless value >= 10 do
        IO.puts(value)
      end

      check_is_ten_or_more(value)
    end
  end

  # sum_list
  def sum_list(list), do: exec_sum(list, 0)

  defp exec_sum([], acc), do: acc

  defp exec_sum([head | tail], acc) do
    acc = acc + head
    exec_sum(tail, acc)
  end
end
