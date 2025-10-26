defmodule NaturalNumbers do
  def print(1), do: IO.puts(1)
  def print(0), do: IO.puts(0)
  
  def print(n) when n > 0 and is_integer(n) do
    print(n - 1)
    IO.puts(n)
  end
   
  def print(n) when is_float(n), do: {:error, "Float numbers are not allowed"}
  
  def print(n) when n < 0, do: {:error, "Negative numbers are not allowed"}
 
  
  def print(_), do: :error
  
end