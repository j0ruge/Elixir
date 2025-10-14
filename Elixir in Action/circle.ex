defmodule Geometry.Circle do
  @moduledoc """
  Implements basic circle functions
  """
  @pi 3.14159

  @doc """
  Computes the area of circle
  """
  @spec area(number) :: number
  def area(r), do: r * r * @pi

  @doc """
  Computes the circunference of circle
  """
  @spec circunference(number) :: number
  def circunference(r), do: 2 * @pi * r
end
