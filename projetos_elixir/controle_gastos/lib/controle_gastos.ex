defmodule ControleGastos do
  @moduledoc """
  Módulo simples de controle de gastos.

  Permite ler, adicionar e salvar registros no formato CSV:
  `"data","valor","método","descrição"`
  """
  @default_path "gastos.csv"

  # Lê o arquivo como Stream (preguiçoso)
  def parse_file(path \\ @default_path), do: stream_lines(path)

  @doc """
  Lê um arquivo CSV simples e retorna uma lista de tuplas no formato:
  `{date, value, payment_method, description}`.

  ## Exemplo

      iex> ControleGastos.read_file("gastos.csv")
      [
        {"2025-10-31", 34.9, "vr", "almoço"},
        {"2025-10-31", 7.6, "rc", "trem"}
      ]
  """
  def read_file(path \\ @default_path), do: stream_lines(path) |> Enum.to_list()

  # Adiciona uma nova linha ao arquivo (append)
  def add_entry(date, value, payment_method, description, path \\ @default_path) do
    line = format_line({date, value, payment_method, description})
    File.write!(path, line <> "\n", [:append])
  end

  # Salva uma lista de entradas sobrescrevendo o arquivo
  def save(entries, path \\ @default_path) do
    content =
      entries
      |> Enum.map(&format_line/1)
      |> Enum.join("\n")

    File.write!(path, content <> "\n")
  end

  # -------------------
  # Funções auxiliares
  # -------------------

  defp stream_lines(path) do
    File.stream!(path)
    |> Stream.map(&parse_line/1)
  end

  @doc false
  # Private helper: Cleans a CSV line, splits by comma, and converts the price field to number.
  defp parse_line(line) do
    [date, value, payment_method, description] =
      line
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.trim(&1, "\""))

    {date, String.to_float(value), payment_method, description}
  end

  defp format_line({date, value, payment_method, description}) do
    "\"#{date}\",#{value},\"#{payment_method}\",\"#{description}\""
  end
end
