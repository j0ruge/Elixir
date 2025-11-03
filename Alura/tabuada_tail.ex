defmodule Module.Tabuada do
  def calcula(multiplicador) when is_integer(multiplicador) and multiplicador > 0 do
    tabuada(multiplicador, 1, [])
  end

  defp tabuada(_produto1, 11, acc), do: acc

  defp tabuada(produto1, produto2, acc) do
    tabuada(produto1, produto2 + 1, acc ++ [produto1 * produto2])
  end
end
