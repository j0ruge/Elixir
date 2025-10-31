defmodule ControleGastos do
  def parse_file(path \\ "gastos.csv")

  @moduledoc """
  Documentation for `ControleGastos`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ControleGastos.hello()
      :world

  """
  def parse_file(path) do
    path
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  @doc false
  # Private helper: Cleans a CSV line, splits by comma, and converts the price field to number.
  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
  end
end
