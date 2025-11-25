defmodule TodoList do
  @moduledoc """
  Implementação de uma estrutura de Lista de Tarefas (Todo List) baseada no livro
  "Elixir em Ação".

  Este módulo permite criar listas, adicionar entradas, buscar por data e atualizar
  itens existentes.

  ## Exemplo Geral

      iex> todo_list = TodoList.new()
      iex> todo_list = TodoList.add_entry(todo_list, %{date: {2013, 12, 19}, title: "Dentist"})
      iex> todo_list = TodoList.add_entry(todo_list, %{date: {2013, 12, 20}, title: "Shopping"})
      iex> TodoList.entries(todo_list, {2013, 12, 19})
      [%{date: {2013, 12, 19}, id: 1, title: "Dentist"}]

  """

  defstruct auto_id: 1, entries: Map.new()

  @type t :: %__MODULE__{
          auto_id: integer(),
          entries: map()
        }

  @doc """
  Cria uma nova instância vazia da TodoList.

  ## Exemplos

      iex> TodoList.new()
      %TodoList{auto_id: 1, entries: %{}}

  """
  @spec new() :: t()
  def new, do: %TodoList{}

  @doc """
  Adiciona uma nova entrada à lista de tarefas.

  A função atribui automaticamente um ID único à entrada e incrementa o contador interno.

  ## Parâmetros

  - `todo_list`: A estrutura `TodoList` atual.
  - `entry`: Um mapa contendo os dados da tarefa (ex: `%{date: ..., title: ...}`).

  ## Exemplos

      iex> list = TodoList.new()
      iex> TodoList.add_entry(list, %{date: {2013, 12, 19}, title: "Dentist"})
      %TodoList{
        auto_id: 2,
        entries: %{1 => %{date: {2013, 12, 19}, id: 1, title: "Dentist"}}
      }

  """
  @spec add_entry(t(), map()) :: t()
  def add_entry(%TodoList{entries: entries, auto_id: auto_id} = todo_list, entry) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put_new(entries, auto_id, entry)

    %TodoList{todo_list | entries: new_entries, auto_id: auto_id + 1}
  end

  @doc """
  Retorna todas as entradas agendadas para uma data específica.

  ## Exemplos

      iex> list = TodoList.new()
      iex> list = TodoList.add_entry(list, %{date: {2013, 12, 19}, title: "Dentist"})
      iex> list = TodoList.add_entry(list, %{date: {2013, 12, 20}, title: "Shopping"})
      iex> TodoList.entries(list, {2013, 12, 19})
      [%{date: {2013, 12, 19}, id: 1, title: "Dentist"}]

      iex> list = TodoList.new()
      iex> TodoList.entries(list, {2023, 1, 1})
      []

  """
  @spec entries(t(), any()) :: [map()]
  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  @doc """
  Atualiza uma entrada específica baseada no ID.

  Se o `entry_id` não existir, a lista original é retornada sem alterações.

  ## Exemplos

      iex> list = TodoList.new() |> TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"})
      iex> # O ID gerado para a primeira entrada é 1
      iex> TodoList.update_entry(list, 1, &Map.put(&1, :date, {2013, 12, 11}))
      %TodoList{
        auto_id: 2,
        entries: %{1 => %{date: {2013, 12, 11}, id: 1, title: "Dentist"}}
      }

      iex> list = TodoList.new()
      iex> TodoList.update_entry(list, 99, fn x -> x end)
      %TodoList{auto_id: 1, entries: %{}}

  """
  @spec update_entry(t(), integer(), (map() -> map())) :: t()
  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, update_fun) do
    case entries[entry_id] do
      nil ->
        todo_list

      old_entry ->
        new_entry = update_fun.(old_entry)
        new_entries = Map.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end
end
