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
    case File.read("reports/#{filename}") do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end
end
