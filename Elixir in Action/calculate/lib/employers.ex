defmodule Employers do
 def list_employers_index(employers) do
  employers
  |> Enum.with_index
  |> Enum.each(fn({employee, index}) -> 
     IO.puts "#{index + 1}. #{employee}"
     end)
 end
 
def lazy_list_employers_index(employers) do
  employers
  |> Stream.with_index
  |> Enum.each(fn({employee, index}) -> 
     IO.puts "#{index + 1}. #{employee}"
     end)
 end
end