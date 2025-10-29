defmodule TodoList do
  def new, do: MultiDict.new()

  def add_entry(todo_list, entry) do
    MultiDict.add(todo_list, entry.date, entry)
  end

  def entries(todo_list, entry) do
    MultiDict.get(todo_list, entry.date)
  end
end
