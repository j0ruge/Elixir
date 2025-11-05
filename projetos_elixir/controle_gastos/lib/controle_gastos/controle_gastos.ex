defmodule ControleGastos do
  @moduledoc """
  Módulo simples de controle de gastos.

  Permite ler, adicionar e salvar registros no formato CSV:
  `"id","data","valor","método_de_pagamento","descrição"`
  """

  @default_path Path.join([:code.priv_dir(:controle_gastos), "gastos_test.csv"])

  # Lê o arquivo como Stream (preguiçoso)
  def parse_file(path \\ @default_path), do: stream_lines(path)

  @doc """
  Lê um arquivo CSV simples e retorna uma lista de tuplas no formato:
  `{id, date, value, payment_method, description}`.

  ## Exemplo

      iex> ControleGastos.read_file("gastos.csv")
      [
        {1, "2025-10-31", 34.9, "vr", "almoço"},
        {2, "2025-10-31", 7.6, "rc", "trem"}
      ]
  """
  def read_file(path \\ @default_path), do: stream_lines(path) |> Enum.to_list()

  # Adiciona uma nova linha ao arquivo (append)
  def add_entry(date, value, payment_method, description, path \\ @default_path) do
    new_id = get_new_id(path)

    new_entry = {new_id, date, value, payment_method, description}
    line = format_line(new_entry)

    File.write!(path, line <> "\n", [:append])
    new_entry
  end

  def add_entry(payment_method, description, path \\ @default_path) do
    new_id = get_new_id(path)

    today = Date.utc_today() |> to_string

    value =
      case description do
        "metrô" -> 7.9
        "trêm" -> 7.6
        _default -> nil
      end

    new_entry = {new_id, today, value, payment_method, description}
    line = format_line(new_entry)

    File.write!(path, line <> "\n", [:append])
    new_entry
  end

  defp get_new_id(path) do
    entries = list_entries(path)

    entries
    |> Enum.map(fn {id, _, _, _, _} -> id end)
    |> Enum.max(fn -> 0 end)
    |> Kernel.+(1)
  end

  def delete_entry(id) do
    entries =
      list_entries()
      |> Enum.reject(fn {entry_id, _, _, _, _} -> entry_id == id end)

    save(entries)
  end

  # Salva uma lista de entradas sobrescrevendo o arquivo
  defp save(entries, path \\ @default_path) do
    content =
      entries
      |> Enum.map(&format_line/1)
      |> Enum.join("\n")

    File.write!(path, content <> "\n")
  end

  # -------------------
  # Funções auxiliares
  # -------------------

  defp list_entries(path \\ @default_path) do
    File.stream!(path)
    |> Enum.map(&parse_line/1)
  end

  defp stream_lines(path) do
    IO.inspect(path)

    File.stream!(path)
    |> Stream.map(&parse_line/1)
  end

  @doc false
  # Private helper: Cleans a CSV line, splits by comma, and converts the price field to number.
  defp parse_line(line) do
    [id, date, value, payment_method, description] =
      line
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.trim(&1, "\""))

    {String.to_integer(id), date, String.to_float(value), payment_method, description}
  end

  defp format_line({id, date, value, payment_method, description}) do
    "\"#{id}\",\"#{date}\",\"#{value}\",\"#{payment_method}\",\"#{description}\""
  end
end
