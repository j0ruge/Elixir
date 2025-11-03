defmodule Module.Tabuada do
  def calcula(multiplicador) when is_integer(multiplicador) and multiplicador > 0 do
    tabuada(multiplicador, 1)
  end

  defp tabuada(_produto1, 11), do: []

  defp tabuada(produto1, produto2) do
    [produto1 * produto2] ++ tabuada(produto1, produto2 + 1)
  end
end
