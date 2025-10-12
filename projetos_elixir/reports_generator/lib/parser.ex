defmodule ReportsGenerator.Parser do
  @moduledoc """
  The `ReportsGenerator.Parser` module is responsible for reading and parsing report files
  used by `ReportsGenerator`.

  It transforms raw CSV lines into structured lists, converting numeric values where necessary.
  Each parsed line follows the format:

      [user_id, food_name, price]

  where:
  - `user_id` is a string identifier for the user (e.g., `"1"`, `"25"`),
  - `food_name` is the name of the food item purchased (e.g., `"pizza"`),
  - `price` is an integer representing the amount spent.

  ## Responsibilities

  * Reads files from the `reports/` directory.
  * Cleans and splits each line.
  * Converts the price field into an integer.
  * Returns a stream suitable for use in `Enum.reduce/3`.

  This modular separation keeps the parsing logic isolated,
  making the main report generator simpler and easier to test.

  ## Examples

      iex> ReportsGenerator.Parser.parse_file("report.csv") |> Enum.take(2)
      [
        ["1", "pizza", 20],
        ["2", "açaí", 15]
      ]
  """

  @doc """
  Parses a report file and returns a stream of processed lines.

  Each line from the given file is cleaned, split, and transformed into a list.
  The function does **not** load the entire file into memory, but uses a lazy `Stream`
  to process lines as needed — ideal for handling large files.

  ## Parameters

    * `filename` — The name of the file to parse (e.g., `"report.csv"`), located in the `reports/` directory.

  ## Returns

    A `Stream` of parsed lines, where each line is a list in the format:
    `[user_id, food_name, price]`.

  ## Examples

      iex> ReportsGenerator.Parser.parse_file("report.csv") |> Enum.to_list()
      [
        ["1", "pizza", 20],
        ["2", "hambúrguer", 15]
      ]
  """
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  @doc false
  # Private helper: Cleans a CSV line, splits by comma, and converts the price field to integer.
  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
