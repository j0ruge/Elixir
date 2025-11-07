use Mix.Config

config :elixir_teste, ElixirTeste.Agendador,jobs: [
    {"* * * * *", fn -> "Executando o Agendador de Tarefas" end}
]

