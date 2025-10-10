defmodule ReportsGenerator do
  @moduledoc """
  Documentation for `ReportsGenerator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ReportsGenerator.hello()
      :world

  """
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(%{}, fn line, report ->
      [id, food_name, price] = parse_line(line)
      Map.put(report, id, price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
