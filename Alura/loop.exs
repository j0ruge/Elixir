defmodule Loop do
    defp tabuada(_, 11), do: :ok

    def tabuada(multiplicador) do
        tabuada(multiplicador, 1)
    end

    defp tabuada(multiplicador, multiplicando) do
        IO.puts("#{multiplicador} x #{multiplicando} = #{multiplicador * multiplicando}")
        tabuada(multiplicador, multiplicando + 1)
    end
end