defmodule CSVSimple do
 def read_simple(path \\ "dados.csv") do
    File.read!(path)
    |> String.split(~r/\r?\n/, trim: true)
    |> Enum.map(&String.split(&1, ","))
    
 end

end