defmodule MapTest do

    def dict do
        days = [sunday: 1, monday: 2, tuesday: 3, wednesday: 4]
        |> Enum.into(Map.new)
        |> Map.put(:thursday, 5)
        |> Enum.each(fn(key_value) ->
            key = elem(key_value, 0)
            value = elem(key_value, 1)
            IO.puts "#{key} => #{value}"
        end
        )
    end
end
