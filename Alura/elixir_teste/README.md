# ElixirTeste

## Projeto de testes com Mix

Neste ponto do estudo, começamos a construir um pequeno projeto de testes em Elixir, explorando como organizar código dentro de uma aplicação criada com o Mix — o gerenciador de projetos do Elixir. A ideia é sair dos códigos isolados no terminal e começar a estruturar módulos, funções e arquivos seguindo as convenções da linguagem.

### Estrutura inicial do projeto

Todo o código de uma aplicação Elixir vive dentro da pasta `lib`. É nesse diretório que o Mix procura os módulos da aplicação. Dentro de `lib`, criamos uma nova pasta com o mesmo nome do projeto, por exemplo, `elixir_teste`. Dentro dela, adicionamos nosso primeiro módulo: `escreve_numero_aleatorio.ex`.

O nome do arquivo segue a convenção de usar `snake_case` (letras minúsculas com *underline*), enquanto o nome do módulo segue o formato `CamelCase`, refletindo o caminho do arquivo:

```elixir
defmodule ElixirTeste.EscreveNumeroAleatorio do
  def escreve do
    numero_aleatorio = :rand.uniform(1000)

    caminho_arquivo =
      Path.join([
        :code.priv_dir(:elixir_teste),
        "arquivo.txt"
      ])

    File.write!(caminho_arquivo, "Número: #{numero_aleatorio}")
  end
end
```

### Explicando o código

O módulo `ElixirTeste.EscreveNumeroAleatorio` gera um número aleatório e grava esse valor dentro de um arquivo chamado `arquivo.txt`. O arquivo é salvo dentro da pasta `priv`, que é o diretório padrão usado em projetos Mix para armazenar arquivos auxiliares ou de configuração.

* `:code.priv_dir(:elixir_teste)` obtém o caminho da pasta `priv` da aplicação `:elixir_teste`.
* `:rand.uniform(1000)` gera um número aleatório entre 1 e 1000.
* `File.write!` escreve o conteúdo no arquivo indicado, interrompendo a execução caso haja erro.

### Executando o código no IEx

Podemos testar o módulo diretamente no terminal interativo, mas dentro do contexto do projeto Mix. Para isso, basta usar o comando:

```bash
iex -S mix
```

Isso inicia o IEx já carregando o ambiente da aplicação, permitindo chamar a função criada:

```elixir
ElixirTeste.EscreveNumeroAleatorio.escreve()
```

O retorno esperado é `:ok`, e o arquivo `priv/arquivo.txt` será criado com um número diferente a cada execução.

### Próximos passos

Até aqui, já entendemos como estruturar e executar código dentro de um projeto Mix. O próximo passo é aprender como criar **tarefas personalizadas do Mix**, o que permitirá executar comandos como `mix escreve` diretamente no terminal para rodar nossa função.

---

## Gerando uma tarefa no Mix

Depois de criar um módulo simples dentro do nosso projeto Elixir, chegou o momento de aprender a gerar uma **tarefa personalizada** — ou seja, um comando que pode ser executado diretamente via terminal, usando o Mix.

### Criando uma nova tarefa

Dentro do diretório `lib/mix/tasks`, criamos um novo arquivo chamado `escreve.ex`.
Por convenção, todas as tarefas do Mix devem estar dentro de um módulo nomeado da seguinte forma:

```elixir
defmodule Mix.Tasks.Escreve do
  def run(_args) do
    IO.puts("Executando código 'escreve'")
  end
end
```

O Mix reconhece qualquer módulo definido como `Mix.Tasks.NomeDaTarefa`.
O nome após `Mix.Tasks.` será o comando que digitamos no terminal, em letras minúsculas.
Por exemplo, o módulo acima será executado com:

```bash
mix escreve
```

Ao rodar o comando, o Mix compila o projeto e exibe no terminal:

```
Executando código 'escreve'
```

### Entendendo a convenção de nomes

O nome do arquivo em si (`escreve.ex`) **não precisa** ser exatamente igual ao nome da tarefa, mas o módulo **precisa** seguir a convenção `Mix.Tasks.<NomeEmCamelCase>`.
Por exemplo, se quisermos criar a tarefa `mix escreve_arquivo`, deveríamos nomear o módulo como:

```elixir
defmodule Mix.Tasks.EscreveArquivo do
  def run(_args), do: IO.puts("Executando tarefa escreve_arquivo")
end
```

Quando executamos `mix escreve_arquivo`, o Mix procura automaticamente por esse módulo em `lib/mix/tasks/`.

### Ligando a tarefa ao código do projeto

Para que nossa tarefa execute o código que já criamos no módulo `ElixirTeste.EscreveNumeroAleatorio`, basta chamá-lo dentro da função `run`:

```elixir
defmodule Mix.Tasks.Escreve do
  def run(_args) do
    ElixirTeste.EscreveNumeroAleatorio.escreve()
  end
end
```

Agora, toda vez que executarmos:

```bash
mix escreve
```

um novo número aleatório será gerado e salvo no arquivo `priv/arquivo.txt`.

### Testando a execução

Rodando o comando várias vezes, podemos ver o conteúdo do arquivo sendo atualizado:

```
Número: 394
Número: 77
Número: 512
```

Cada execução gera um novo valor, confirmando que nossa tarefa está funcionando corretamente.

### Próximos passos

Por enquanto, nossa tarefa é funcional, mas ainda não aparece na lista de comandos ao digitar `mix help`.
No próximo passo, vamos aprender a **documentar a tarefa**, para que o Mix a reconheça oficialmente e exiba sua descrição na lista de comandos disponíveis.
