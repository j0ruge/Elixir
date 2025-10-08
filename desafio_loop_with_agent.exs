defmodule DesafioLoop do
    use Agent

    #inicia o agente com a lista vazia
    defp start_link() do
        Agent.start_link(fn -> [] end, name: __MODULE__)
        |> case do
            {:error, {:already_started, pid}} -> :ok
            _ -> :ok
        end
    end
    
    #adiciona itens na lista
    defp adicionar(item) do
        Agent.update(__MODULE__, fn lista -> [item | lista] end)        
    end

    # lê a lista
    def listar() do
        Agent.get(__MODULE__, & &1)        
    end

    defp limpar_lista() do
        Agent.update(__MODULE__, fn _ -> [] end)
    end
    
    defp tabuada(_, 11), do: Enum.reverse(listar())

    defp tabuada(multiplicador, multiplicando) do
        adicionar(multiplicador * multiplicando)
        tabuada(multiplicador, multiplicando + 1)        
    end

    def tabuada(multiplicador) do
        start_link()
        limpar_lista()
        tabuada(multiplicador, 1)
    end
end