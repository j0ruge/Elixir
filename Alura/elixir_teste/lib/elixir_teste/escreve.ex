defmodule Mix.Tasks.Escreve do
 use Mix.Task
  @moduledoc """
    Documentação do módulo

    > `mix escreve`
  
  """
  
  @shortdoc "Escreve um número aleatório no arquivo.txt"
  
  def run(_) do
    IO.puts("Executando código 'escreve' 🐀🪽")
    ElixirTeste.EscreveNumeroAleatorio.escreve()
  end
end
