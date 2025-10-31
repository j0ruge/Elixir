defmodule Module.Tabuada do
  def calcula(multiplicador) do
    tabuada(multiplicador, 1)
  end

  defp tabuada(_produto1, 11), do: []

  defp tabuada(produto1, produto2) do
    [produto1 * produto2] ++ tabuada(produto1, produto2 + 1)
  end
end
