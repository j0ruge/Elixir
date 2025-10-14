defmodule Geometry do
  def rectangle_area(a, b), do: a * b
end

defmodule Calculator do
  def sum(a, b \\ 0) do
    a + b
  end

  def fun(a, b \\ 0, c, d \\ 2) do
    a + b + c + d
  end
end

defmodule MyModule do
  import IO
  alias String, as: MyString

  def my_function do
    "Calling imported function"
    |> MyString.upcase()
    |> puts()
  end
end
