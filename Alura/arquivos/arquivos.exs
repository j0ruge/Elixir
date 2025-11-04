defmodule Module.Files do
  def read_file(path) do
    case File.read(path) do
    {:ok, content} -> IO.puts(content)
    {:error, :enoent} -> "Aquivo inexistente"
    _default -> "Algum erro ocorreu"
    end
    
  end
end