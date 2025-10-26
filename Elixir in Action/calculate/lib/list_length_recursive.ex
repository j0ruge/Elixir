defmodule ListHelper do
 def length(list) do
  do_length(0, list)
 end
 
 defp do_length(acc, []), do: acc
 
 defp do_length(acc, [ _ | tail]) do
  acc + 1
  |> do_length(tail)
 end
 
 defp do_length( _, _ ), do: {:error, "An list must be provided"}
end