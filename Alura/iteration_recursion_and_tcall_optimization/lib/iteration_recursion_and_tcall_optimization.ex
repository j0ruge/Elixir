defmodule Recursion do
  # Using Enum twice
  def sum_numbers_enum(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.reduce(0, fn n, sum -> n + sum end)
  end

  # Using body-recursion
  def sum_numbers_recursion([head | tail]) when is_number(head) do
    sum_numbers_recursion(tail) + head
  end

  def sum_numbers_recursion([_head | tail]) do
    sum_numbers_recursion(tail)
  end

  def sum_numbers_recursion([]) do
    0
  end

  # Using tail-call optimization
  def sum_numbers_tail_call(list) do
    do_sum_tail_call(list, 0)
  end

  defp do_sum_tail_call([head | tail], sum) when is_number(head) do
    do_sum_tail_call(tail, sum + head)
  end

  defp do_sum_tail_call([_head | tail], sum) do
    do_sum_tail_call(tail, sum)
  end

  defp do_sum_tail_call([], sum) do
    sum
  end

  # Segunda bateria de benchmarks
  def double_numbers1(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.map(fn n -> n * 2 end)
  end

  def double_numbers2([]) do
    []
  end

  def double_numbers2([head | tail]) when is_number(head) do
    [head * 2 | double_numbers2(tail)]
  end

  def double_numbers2([_head | tail]) do
    double_numbers2(tail)
  end

  def double_numbers3(list) do
    list
    |> do_double_numbers3([])
    |> Enum.reverse()
  end

  defp do_double_numbers3([], acc) do
    acc
  end

  defp do_double_numbers3([head | tail], acc) when is_number(head) do
    do_double_numbers3(tail, [head * 2 | acc])
  end

  defp do_double_numbers3([_head | tail], acc) do
    do_double_numbers3(tail, acc)
  end

  def double_numbers4(list) do
    do_double_numbers3(list, [])
  end

  def double_numbers5(list) do
    do_double_numbers5(list, [])
  end

  defp do_double_numbers5([], acc) do
    acc
  end

  defp do_double_numbers5([head | tail], acc) when is_number(head) do
    do_double_numbers5(tail, acc ++ [head * 2])
  end

  defp do_double_numbers5([_head | tail], acc) do
    do_double_numbers5(tail, acc)
  end

  def double_numbers6(list) do
    for n when is_number(n) <- list, do: n * 2
  end
end
