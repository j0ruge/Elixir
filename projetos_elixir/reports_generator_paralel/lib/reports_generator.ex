defmodule ReportsGenerator do
  @moduledoc """
  O módulo `ReportsGenerator` é responsável por gerar relatórios a partir
  de arquivos CSV contendo dados de pedidos de comida.

  Ele analisa os arquivos usando o `ReportsGenerator.Parser`, soma os valores
  gastos por cada usuário e contabiliza a quantidade de vezes que cada alimento
  foi pedido.

  ## Funcionalidades principais

    * `build/1` – lê e processa o arquivo informado, retornando um mapa com
      totais de gastos por usuário e contagem de alimentos.
    * `fetch_higher_cost/2` – recebe um relatório gerado e retorna a chave e
      valor com maior total, seja de um usuário ou de um alimento.

  ## Exemplo completo

      iex> alias ReportsGenerator.Parser
      iex> File.write!("reports/test.csv", "1,pizza,30\\n2,açaí,20\\n1,pizza,25\\n")
      iex> report = ReportsGenerator.build("test.csv")
      iex> report["users"]["1"]
      55
      iex> report["foods"]["pizza"]
      2
  """

  alias ReportsGenerator.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options ["users", "foods"]

  @doc """
  Lê o arquivo CSV indicado e gera um relatório com a soma de gastos por usuário
  e a contagem de alimentos consumidos.

  ## Exemplos

      iex> File.write!("reports/sample.csv", "1,pizza,30\\n2,sushi,40\\n1,pizza,20\\n")
      iex> ReportsGenerator.build("sample.csv")
      %{
        "foods" => %{
          "açaí" => 0, "churrasco" => 0, "esfirra" => 0,
          "hambúrguer" => 0, "pastel" => 0, "pizza" => 2,
          "prato_feito" => 0, "sushi" => 1
        },
        "users" => %{
          "1" => 50, "2" => 40, "3" => 0, "4" => 0, "5" => 0, "6" => 0,
          "7" => 0, "8" => 0, "9" => 0, "10" => 0, "11" => 0, "12" => 0,
          "13" => 0, "14" => 0, "15" => 0, "16" => 0, "17" => 0, "18" => 0,
          "19" => 0, "20" => 0, "21" => 0, "22" => 0, "23" => 0, "24" => 0,
          "25" => 0, "26" => 0, "27" => 0, "28" => 0, "29" => 0, "30" => 0
        }
      }
  """
  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def build_from_many(file_names) when not is_list(filenames) do
    {:error, "Please provide a list of strings"}
  end

  def build_from_many(file_names) do
    file_names
    |> Task.async_stream(&build/1)
    |> Enum.reduce(report_acc(), fn {:ok, result}, report -> sum_reports(report, result) end)
  end

  @doc """
  Retorna o item com o maior valor total no relatório gerado, de acordo
  com a opção informada.

  A opção pode ser `"users"` (para maiores gastos) ou `"foods"` (para alimentos mais pedidos).

  ## Exemplos

      iex> report = %{
      ...>   "users" => %{"1" => 45, "2" => 33, "3" => 20},
      ...>   "foods" => %{"pizza" => 4, "hambúrguer" => 2, "açaí" => 1}
      ...> }
      iex> ReportsGenerator.fetch_higher_cost(report, "users")
      {:ok, {"1", 45}}

      iex> report = %{
      ...>   "users" => %{"1" => 45, "2" => 33, "3" => 20},
      ...>   "foods" => %{"pizza" => 4, "hambúrguer" => 2, "açaí" => 1}
      ...> }
      iex> ReportsGenerator.fetch_higher_cost(report, "foods")
      {:ok, {"pizza", 4}}

      iex> report = %{
      ...>   "users" => %{"1" => 45, "2" => 33, "3" => 20},
      ...>   "foods" => %{"pizza" => 4, "hambúrguer" => 2, "açaí" => 1}
      ...> }
      iex> ReportsGenerator.fetch_higher_cost(report, "invalid")
      {:error, "Invalid option"}
  """

  def fetch_higher_cost(report, option) when option in @options do
    {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def fetch_higher_cost(_report, _option), do: {:error, "Invalid option"}

  defp sum_reports(%{"foods" => foods1, "users" => users1}, %{
         "foods" => foods2,
         "users" => users2
       }) do
    foods = merge_maps(foods1, foods2)
    users = merge_maps(users1, users2)

    build_report(foods, users)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp sum_values([id, food_name, price], %{"foods" => foods, "users" => users} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    report
    |> Map.put("users", users)
    |> Map.put("foods", foods)

    # Outra opção de fazer o map é %{report | "users" => users, "foods" => foods}
  end

  defp report_acc do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users = Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})

    build_report(foods, users)
  end

  defp build_report(foods, users), do: %{"users" => users, "foods" => foods}
end
