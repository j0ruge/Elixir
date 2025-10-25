defmodule Calculate do
  @moduledoc """
  Documentation for `Calculate`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Calculate.hello()
      :world

  """
  def sum(a,b) do
    a + b
  end

  def iolist do
    iolist = [[["H","e"],"llo"]," worl", "d!"]
    iolist = [iolist, ", This "]
    iolist = [iolist, "is a iolist"]


    iolist    
    |> IO.puts
  end

  def max(a, b) do
  if a >= b, do: a, else: b
  end

  def unless_max(a, b) do
   unless a >= b, do: b, else: a 
  end

  def cond_max(a,b) do
   cond do
    a >= b -> a
    true   -> b
    end
  end
  
  def case_max(a,b) do
    case a >= b do
      true -> a
      false -> b
     end
  end
  
 def lazy_list_square(list) do
  list
  |> Stream.filter(&(is_number(&1) and &1 > 0))
  |> Stream.map(&{&1, :math.sqrt(&1) })
  |> Stream.with_index
  |> Enum.each(
      fn({{input, result}, index} ) ->
      IO.puts "#{index + 1}. sqrt(#{input}) = #{result}" end
  )
 end
end