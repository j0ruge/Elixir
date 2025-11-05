defmodule Mix.Tasks.Escreve do
  def run(_) do
    IO.puts("Executando código 'escreve' 🐀🪽")
    ElixirTeste.EscreveNumeroAleatorio.escreve()
  end
end
