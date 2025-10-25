defmodule FileHelper do
  def larger_lines(path \\ "calculate.ex") do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 40))
  end

  def lines_lenght(path \\ "calculate.ex") do
    index_file_stream_lines(path)
    |> Enum.each(fn {line, index} -> IO.puts("#{index}. #{String.length(line)}") end)
  end

  def longest_line_length!(path \\ "calculate.ex") do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.into([], fn line -> String.length(line) end)
    |> Enum.max()
  end

  def longest_line!(path \\ "calculate.ex") do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.into([], fn line -> {String.length(line), line} end)
  end

  defp index_file_stream_lines(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.with_index(1)
  end
end
