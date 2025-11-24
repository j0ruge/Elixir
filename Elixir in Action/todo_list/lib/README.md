# TODO LIST

## Criando uma instância da classe TodoList

```elixir
todo_list = TodoList.new

```

```elixir
todo_list
|> TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"})
|> TodoList.add_entry(%{date: {2013, 12, 20}, title: "Shopping"})
|> TodoList.add_entry(%{date: {2013, 12, 19}, title: "Movies"})
```

```elixir
todo_list = TodoList.new
|> TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"})
|> TodoList.add_entry(%{date: {2013, 12, 20}, title: "Shopping"})
|> TodoList.add_entry(%{date: {2013, 12, 19}, title: "Movies"})

```

## Atualizando uma entrada

```elixir
TodoList.update_entry(
todo_list,
1,
&Map.put(&1, :date, {2013, 12, 11})
)
```

## Filtrando entradas por data

```elixir
TodoList.entries(todo_list, {2013, 12, 19})
```

:memo: Página 117 do livro "Elixir em Ação", 3ª Edição.
