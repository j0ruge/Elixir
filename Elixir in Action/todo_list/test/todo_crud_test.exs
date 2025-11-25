defmodule TodoListTest do
  use ExUnit.Case, async: true
  doctest TodoList

  describe "new/0" do
    test "creates an empty todo list" do
      assert %TodoList{auto_id: 1, entries: %{}} == TodoList.new()
    end
  end

  describe "add_entry/2" do
    test "adds an entry to the list and increments auto_id" do
      todo_list = TodoList.new()
      entry = %{date: ~D[2024-01-01], title: "Buy milk"}

      new_todo_list = TodoList.add_entry(todo_list, entry)

      assert new_todo_list.auto_id == 2
      assert map_size(new_todo_list.entries) == 1

      added_entry = new_todo_list.entries[1]
      assert added_entry.id == 1
      assert added_entry.date == ~D[2024-01-01]
      assert added_entry.title == "Buy milk"
    end
  end

  describe "entries/2" do
    setup do
      date1 = ~D[2024-01-01]
      date2 = ~D[2024-01-02]
      entry1 = %{date: date1, title: "Entry 1"}
      entry2 = %{date: date2, title: "Entry 2"}
      entry3 = %{date: date1, title: "Entry 3"}

      todo_list =
        TodoList.new()
        |> TodoList.add_entry(entry1)
        |> TodoList.add_entry(entry2)
        |> TodoList.add_entry(entry3)

      %{todo_list: todo_list, date1: date1, date2: date2}
    end

    test "returns entries for a given date", %{todo_list: todo_list, date1: date1} do
      entries_for_date = TodoList.entries(todo_list, date1)
      assert length(entries_for_date) == 2
      titles = Enum.map(entries_for_date, & &1.title)
      assert "Entry 1" in titles
      assert "Entry 3" in titles
    end

    test "returns an empty list for a date with no entries", %{todo_list: todo_list} do
      assert TodoList.entries(todo_list, ~D[2025-01-01]) == []
    end
  end

  describe "update_entry/3" do
    test "updates an existing entry" do
      todo_list =
        TodoList.new() |> TodoList.add_entry(%{date: ~D[2024-01-01], title: "Old Title"})

      updated_list =
        TodoList.update_entry(todo_list, 1, fn entry -> %{entry | title: "New Title"} end)

      [updated_entry] = TodoList.entries(updated_list, ~D[2024-01-01])
      assert updated_entry.title == "New Title"
    end

    test "does nothing if entry_id does not exist" do
      todo_list =
        TodoList.new() |> TodoList.add_entry(%{date: ~D[2024-01-01], title: "Some Title"})

      updated_list =
        TodoList.update_entry(todo_list, 999, fn entry -> %{entry | title: "New Title"} end)

      assert todo_list == updated_list
    end
  end
end
