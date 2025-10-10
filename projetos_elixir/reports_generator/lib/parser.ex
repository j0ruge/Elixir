defmodule ReportsGenerator.Parser do
  @moduledoc """
  Documentation for `ReportsGenerator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ReportsGenerator.hello()
      :world

  """
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
