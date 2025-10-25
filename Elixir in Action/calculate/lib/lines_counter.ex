defmodule LinesCounter do
 def count(path) do
  File.read(path)
  |> lines_number
 end

 defp lines_number({:ok, contents}) do
   contents
   |> String.split("\n")
   |> length
 end	

 defp lines_number(error), do: error
end
