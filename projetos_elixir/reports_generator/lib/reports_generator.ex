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
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "❌ Error while opening file!"
end
