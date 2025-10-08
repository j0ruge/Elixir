defmodule DesafioLoop do
    def tabuada(multiplicador), do: tabuada(multiplicador, 1, [])

    defp tabuada(_, 11, lista), do: Enum.reverse(lista)

    defp tabuada(multiplicador, multiplicando, lista) do
        tabuada(multiplicador, multiplicando + 1, [multiplicador * multiplicando | lista])
    end    
end