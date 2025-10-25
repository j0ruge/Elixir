defmodule ListHelper do
 def smallest(list) when length(list) > 0 do
  Enum.min(list)
 end

 def smallest(_), do: {:error, :invalid_argumen}

 def sum([]), do: 0 
 def sum([head|tail]), do: head + sum(tail)
 
 def range(from, to) do 
  do_range([], from, to)
 end
 
 defp do_range(list, acc, final_number) when acc > final_number do
    Enum.reverse(list)
  end
  
  defp do_range(list, acc, final_number) when acc <= final_number do
    [acc] ++ list 
    |> do_range(acc + 1, final_number)
  end
  
  def positive(list) when is_list(list) do
    do_positive(list, [])
  end
  
  defp do_positive(list, new_list) when length(list) == 0 do
   new_list
  end 
  
  defp do_positive([ head | tail], new_list) when head < 0 do
    do_positive(tail, new_list)
  end
  
  defp do_positive([ head | tail], new_list) when head > 0 do
    new_list = new_list ++ [head]
    do_positive(tail, new_list)
  end

end
