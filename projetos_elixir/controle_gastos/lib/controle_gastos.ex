defmodule ControleGastos do
  def parse_file(path \\ "gastos.csv"), do: stream_lines(path)

  @doc """
  Lê um arquivo CSV simples e retorna uma lista de tuplas no formato:
  `{date, value, method, description}`.

  ## Exemplo

      iex> ControleGastos.read_file("gastos.csv")
      [
        {"2025-10-31", 34.9, "vr", "almoço"},
        {"2025-10-31", 7.6, "rc", "trem"}
      ]
  """
  def read_file(path \\ "gastos.csv"), do: stream_lines(path) |> Enum.to_list()

  @moduledoc """
  Documentation for `ControleGastos`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ControleGastos.hello()
      :world

  """

  # def parse_file(path) do
  #   path
  #   |> File.stream!()
  #   |> Stream.map(fn line -> parse_line(line) end)
  # end

  # def read_file(path) do
  #   path
  #   |> File.stream!()
  #   |> Enum.map(fn line -> parse_line(line) end)
  # end

  defp stream_lines(path) do
    File.stream!(path)
    |> Stream.map(&parse_line/1)
  end

  @doc false
  # Private helper: Cleans a CSV line, splits by comma, and converts the price field to number.
  defp parse_line(line) do
    [date, value, method, description] =
      line
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.trim(&1, "\""))

    {date, String.to_float(value), method, description}
  end

  # defp parse_line(line) do
  #   line
  #   |> String.trim()
  #   |> String.split(",")
  #   |> Enum.map(&String.trim(&1, "\""))
  #   |> List.update_at(1, &String.to_float/1)
  # end
end
