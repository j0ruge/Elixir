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
    File.stream!(path)
  end
end
