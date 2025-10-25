defmodule ListHelper do
  def sum(list) do
    do_sum(0, list)
  end
  
  defp do_sum(acc, []) do
    acc
  end
  
  defp do_sum(acc, [head | tail]) do
    acc + head
    |> do_sum(tail)
  end
  
  
end