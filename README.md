# Estudos em Elixir

Este repositório reúne exemplos e materiais para aprender e praticar Elixir, uma linguagem funcional, concorrente e escalável desenvolvida para criar aplicações robustas e distribuídas.

- [Estudos em Elixir](#estudos-em-elixir)
  - [Sobre Elixir](#sobre-elixir)
  - [Como criar um novo projeto Elixir](#como-criar-um-novo-projeto-elixir)
  - [Adicionando uma lib externa](#adicionando-uma-lib-externa)
  - [Como executar exemplos](#como-executar-exemplos)
  - [Como importar um arquivo no IEx](#como-importar-um-arquivo-no-iex)
  - [Como inspecionar um elemento em Elixir](#como-inspecionar-um-elemento-em-elixir)
  - [Tipos de Dados](#tipos-de-dados)
    - [Strings](#strings)
      - [Concatenação e interpolação](#concatenação-e-interpolação)
      - [Caracteres de escape](#caracteres-de-escape)
      - [Conclusão](#conclusão)
    - [Listas](#listas)
      - [Estrutura interna](#estrutura-interna)
      - [Operações básicas](#operações-básicas)
      - [Cabeça e cauda](#cabeça-e-cauda)
      - [Operador cons (`|`)](#operador-cons-)
      - [Pattern Matching](#pattern-matching)
      - [Conclusão](#conclusão-1)
  - [Macros](#macros)
  - [Pattern Matching](#pattern-matching-1)
  - [Detalhes de sintaxe](#detalhes-de-sintaxe)
  - [Funções anônimas](#funções-anônimas)
  - [Bom e velho if/else](#bom-e-velho-ifelse)
  - [Controle de Fluxo](#controle-de-fluxo)
    - [Recursividade](#recursividade)
  - [Libs](#libs)
    - [Credo](#credo)
      - [Instalação](#instalação)
  - [Extensões para VSCode](#extensões-para-vscode)
  - [Pipe Operator](#pipe-operator)
    - [Como funciona](#como-funciona)
    - [Benefícios](#benefícios)
  - [Chamadas de Funções Implícitas vs Explícitas](#chamadas-de-funções-implícitas-vs-explícitas)
    - [Forma Explícita](#forma-explícita)
    - [Forma Implícita](#forma-implícita)
    - [Comparação](#comparação)
    - [Conclusão](#conclusão-2)
  - [Enum](#enum)
    - [Enum.into](#enuminto)
      - [📦 Estrutura](#-estrutura)
      - [💡 Exemplos básicos](#-exemplos-básicos)
        - [1. Convertendo um `Range` em `List`](#1-convertendo-um-range-em-list)
        - [2. Criando um `Map` a partir de uma lista de tuplas](#2-criando-um-map-a-partir-de-uma-lista-de-tuplas)
        - [3. Adicionando elementos a um `Map` existente](#3-adicionando-elementos-a-um-map-existente)
        - [4. Convertendo um `Map` em uma `List`](#4-convertendo-um-map-em-uma-list)
      - [🧠 Quando usar `Enum.into`](#-quando-usar-enuminto)
      - [🚀 Exemplo prático com pipeline](#-exemplo-prático-com-pipeline)
      - [🧩 Integração com o código do projeto](#-integração-com-o-código-do-projeto)
    - [🧾 Resumo](#-resumo)
  - [Guard Clauses](#guard-clauses)
    - [Exemplo prático](#exemplo-prático)
    - [Explicação detalhada](#explicação-detalhada)
    - [O que acontece na prática](#o-que-acontece-na-prática)
    - [Observações importantes](#observações-importantes)
    - [Em resumo](#em-resumo)
  - [Parâmetros padrão](#parâmetros-padrão)
    - [Exemplo prático](#exemplo-prático-1)
    - [Explicação](#explicação)
    - [Cabeçalhos de função e múltiplas cláusulas](#cabeçalhos-de-função-e-múltiplas-cláusulas)
    - [Ordem de avaliação](#ordem-de-avaliação)
    - [Resumo](#resumo)
    - [Exemplos de uso](#exemplos-de-uso)
  - [Convenções de nome](#convenções-de-nome)
    - [Casing — uso de maiúsculas e minúsculas](#casing--uso-de-maiúsculas-e-minúsculas)
    - [Uso do underscore (`_`)](#uso-do-underscore-_)
    - [Pontuação em nomes de funções](#pontuação-em-nomes-de-funções)
      - [Funções terminadas com `!`](#funções-terminadas-com-)
      - [Funções terminadas com `?`](#funções-terminadas-com--1)
    - [`is_` vs `?` em funções booleanas](#is_-vs--em-funções-booleanas)
    - [`size` vs `length`](#size-vs-length)
    - [Resumo das principais convenções](#resumo-das-principais-convenções)
  - [Objetivo](#objetivo)

## Sobre Elixir

Elixir é uma linguagem de programação funcional que roda na máquina virtual Erlang (BEAM). Ela é conhecida por sua sintaxe expressiva, suporte nativo à concorrência, tolerância a falhas e facilidade para construir sistemas distribuídos e de alta disponibilidade.

Principais características:

- **Imutabilidade:** Os dados em Elixir são imutáveis, promovendo segurança e previsibilidade.
- **Concorrência:** Utiliza o modelo de atores do Erlang para criar processos leves e paralelos.
- **Escalabilidade:** Projetada para aplicações que exigem alta performance e disponibilidade.
- **Sintaxe moderna:** Inspirada em Ruby, tornando o código mais legível.

## Como criar um novo projeto Elixir

Para criar um novo projeto Elixir, você pode usar a ferramenta de linha de comando `mix`, que é o gerenciador de projetos e build tool do Elixir. Siga os passos abaixo:

1. **[Instale o Elixir](https://elixir-lang.org/install.html):** Certifique-se de ter o Elixir instalado em sua máquina. Você pode verificar isso executando `elixir -v` no terminal.
2. **Crie um novo projeto:** Use o comando `mix new nome_do_projeto` para criar um novo projeto. Substitua `nome_do_projeto` pelo nome desejado para o seu projeto.

   ```sh
   mix new meu_projeto
   ```

## Adicionando uma lib externa

Para adicionar uma biblioteca externa ao seu projeto Elixir, você precisa editar o arquivo `mix.exs` localizado na raiz do seu projeto. Siga os passos abaixo:

1. **Abra o arquivo `mix.exs`:** Use um editor de texto ou IDE para abrir o arquivo.
2. **Adicione a dependência:** No bloco `defp deps do`, adicione a dependência desejada. Por exemplo, para adicionar a biblioteca `httpoison`, você faria o seguinte:

   ```elixir
   defp deps do
     [
       {:httpoison, "~> 1.8"}
     ]
   end
   ```

Você pode pedir para baixar as dependências com o comando:

```sh
mix deps.get
```

---

## Como executar exemplos

Para rodar um arquivo Elixir, utilize o comando:

```sh
elixir nome_do_arquivo.exs
```

Exemplo:

```sh
elixir teste.exs
```

## Como importar um arquivo no IEx

Importar um arquivo no IEx (*Interactive Elixir*) permite que você utilize as funções e módulos definidos nesse arquivo durante a sessão interativa. Para carregar um arquivo, use o comando `c("nome_do_arquivo.exs")`.

Ainda pode se usar `import_file("nome_do_arquivo.exs")` para importar o arquivo.

---

## Como inspecionar um elemento em Elixir

Use `IO.inspect/1` para imprimir o valor de uma variável ou expressão no console, útil para depuração.

---

## Tipos de Dados

Claro! Aqui está o resumo formatado para o teu `README.md`, ajustado para o nível mais alto ser **### Strings**:

---

### Strings

Strings em Elixir são sempre declaradas **entre aspas duplas** (`"texto"`).  
Diferente de algumas linguagens como JavaScript ou PHP, que permitem aspas simples, em Elixir **aspas simples representam uma *charlist*** — uma lista de códigos numéricos referentes a caracteres (`'texto'` → `[116, 101, 120, 116, 111]`).  
Por isso, no uso cotidiano, trabalhamos apenas com strings entre aspas duplas.

As strings em Elixir são **UTF-8 por padrão**, o que garante suporte a acentuação e caracteres especiais sem necessidade de configuração adicional.  
Isso significa que o tamanho em bytes (`byte_size/1`) pode ser diferente do número de caracteres (`String.length/1`), já que alguns caracteres acentuados ocupam mais de um byte.

Exemplo:

```elixir
byte_size("Vinícius")   # 9
String.length("Vinícius") # 8
```

#### Concatenação e interpolação

Para **concatenar strings**, utiliza-se o operador `<>`:

```elixir
"Bem-vindo " <> nome <> "."
```

Outra forma mais legível é a **interpolação**, que insere variáveis dentro da string usando `#{}`:

```elixir
"Bem-vindo #{nome}."
```

#### Caracteres de escape

Assim como em outras linguagens, Elixir suporta caracteres de escape, como `\n` para quebra de linha:

```elixir
IO.puts("Bem-vindo\n#{nome}.")
```

#### Conclusão

Strings em Elixir são:

- **imutáveis** (como todos os tipos de dados na linguagem);
- **UTF-8 nativas**;
- manipuladas com facilidade usando o módulo `String`;
- compatíveis com operações de concatenação e interpolação elegantes.

A partir desse ponto, o curso segue para **tipos compostos**, como listas, que permitem trabalhar com coleções de valores.

---

### Listas

Em Elixir, listas são coleções ordenadas de elementos delimitadas por colchetes, por exemplo:

```elixir
primeira_lista = [1, 2, 3]
```

Os elementos podem ser de tipos diferentes:

```elixir
[1, "dois", :tres, 4.0]
```

#### Estrutura interna

Diferente de arrays em linguagens como Java, C# ou JavaScript, as listas em Elixir são **listas ligadas simples**.
Cada elemento contém:

- um **valor**, e
- um **ponteiro** para o próximo elemento.

Por isso, adicionar elementos **no final** é uma operação **custosa**, enquanto adicionar **no início** é **muito rápido**.

#### Operações básicas

- **Concatenação:**

  ```elixir
  [1, 2, 3] ++ [4, 5, 6]
  # => [1, 2, 3, 4, 5, 6]
  ```

- **Remoção:**

  ```elixir
  [1, 2, 3] -- [2]
  # => [1, 3]
  ```

Essas operações retornam **novas listas**, não alteram a original — por isso dizemos que Elixir é **imutável**.

#### Cabeça e cauda

- `hd(lista)` retorna o **primeiro elemento** (head).
- `tl(lista)` retorna o **restante da lista** (tail).

Exemplo:

```elixir
hd([1, 2, 3]) # => 1
tl([1, 2, 3]) # => [2, 3]
```

#### Operador cons (`|`)

O operador `|` é usado para construir listas rapidamente:

```elixir
[0 | [1, 2, 3]]
# => [0, 1, 2, 3]
```

Ele indica que `0` é a **cabeça** e `[1, 2, 3]` é a **cauda**.

#### Pattern Matching

Podemos decompor listas com **pattern matching**:

```elixir
[head | tail] = [0, 1, 2, 3, 4]
# head => 0
# tail => [1, 2, 3, 4]
```

#### Conclusão

- Listas em Elixir são **listas ligadas simples**.
- Inserir no início é eficiente; inserir no final é lento.
- Elas são **imutáveis**, e cada operação retorna uma nova lista.
- O conceito de **head** e **tail** é fundamental e se conecta diretamente ao **pattern matching**, amplamente usado na linguagem.

---

## Macros

Macros são uma forma poderosa de metaprogramação em Elixir, permitindo que você escreva código que gera código. Elas são definidas usando a palavra-chave `defmacro` e podem ser usadas para criar DSLs (Domain Specific Languages) ou para simplificar padrões repetitivos em seu código.

Mais sobre macros pode ser encontrado na [documentação oficial](https://hexdocs.pm/elixir/Macro.html).

## Pattern Matching

- Em Elixir o operador `=` não é atribuição; é o operador de match: tenta casar duas expressões.
- Se o lado esquerdo for uma variável inexistente, o match cria (vincula) essa variável ao valor do lado direito.
- O match verifica equivalência entre valores, então `1 = x` funciona se `x` for `1`.
- Para comparar com uma variável já vinculada (evitar reatribuição) use o operador pin `^`. Ex.: `[a, ^x, c]` falha se `x` não corresponder ao valor.
- Quando padrões não coincidem ocorre `MatchError` — útil para tratar fluxos diferentes, por exemplo retornos de `File.read`: `{:ok, conteudo}` vs `{:error, motivo}`.
- Pattern matching funciona em estruturas compostas: tuplas, listas e com o operador cons (`[head | tail]`) para extrair cabeça e cauda.
- Pode-se exigir valores literais no padrão: `[a, 1, c]` casa apenas se o segundo elemento for `1`.
- Use `_` para ignorar posições do padrão sem criar variáveis.

Aplicações comuns: extrair resultados de funções que retornam `{:ok, valor}`/`{:error, motivo}`, decompor listas e direcionar fluxo por padrões de entrada nas funções.

## Detalhes de sintaxe

- Funções são cidadãos de primeira classe: podem ser atribuídas a variáveis, passadas como parâmetro e retornadas por outras funções.
- Sintaxe curta: se a função tem apenas uma expressão, pode ser definida em uma única linha usando vírgula, `do:` e o corpo. Ex.: def soma(a, b), do: a + b
- Todas as funções devem ser definidas dentro de um módulo — `def` (macro) não pode ser usado fora de módulos.
- Funções privadas: use `defp` para criar funções acessíveis apenas dentro do próprio módulo (útil para organizar código sem expor implementação).
- Funções privadas podem ser chamadas normalmente por outras funções do mesmo módulo; externamente elas não estão disponíveis.
- Alternativa às funções nomeadas: funções anônimas podem ser usadas quando você precisa passar/compor comportamento sem declarar uma função pública.

## Funções anônimas

- Funções são cidadãos de primeira classe: podem ser atribuídas a variáveis, passadas como parâmetro e retornadas por outras funções.
- Captura de função existente: use o operador & com aridade para referenciar uma função já definida — ex.: `is_number/1 → i_n = &is_number/1`; chame com `i_n.(valor)`.
- Função anônima literal: `fn params -> corpo end`. Ex.: `Enum.map(lista, fn num -> num * 2 end)`.
- Sintaxe de captura curta: `&(&1 * 2)` é equivalente a `fn x -> x * 2 end`; &1, &2 ... referenciam parâmetros por posição.
- Use funções anônimas quando precisar de comportamento temporário ou passar lógica inline (equivalente a closures/lambdas em outras linguagens).

## Bom e velho if/else

- If/else: sintaxe simples — `if condição do ... else ... end`.
  Ex.:

  ```elixir
  def primeiro(lista) do  
    if length(lista) == 0 do  
      nil  
    else  
      hd(lista)  
    end  
  end
  ```

- Unless: oposto de if — `unless condição do ... end` (possui else opcional).

- Observações:
  - true, false e nil são literais especiais (não usam dois-pontos).
  - Não há elseif direto; para fluxo equivalente é preciso aninhar if dentro de else (menos elegante).

- Preferência em Elixir:
  - Muitas vezes evita-se condicionais usando pattern matching: definir várias cláusulas da mesma função para casos distintos. Ex.:  

```elixir
    def primeiro([]), do: nil  
    def primeiro([h | _]), do: h
```

- Guard clauses: alternativa para selecionar cláusulas de função com condições adicionais (útil quando pattern matching simples não é suficiente).

## Controle de Fluxo

### Recursividade

Diferente das linguagens imperativas, Elixir **não possui loops tradicionais** como `for` ou `while`. Em vez disso, o controle de repetição é feito por meio de **recursão** — uma função chamando a si mesma até que uma condição de parada seja atingida.

No exemplo apresentado, foi criada uma função `tabuada/1` que, ao receber um número, chama outra versão da função (`tabuada/2`) responsável por multiplicar esse número por valores de 1 a 10. Quando o segundo parâmetro chega a 11, a recursão é interrompida com `def tabuada(_, 11), do: nil`.

Esse comportamento é controlado por **pattern matching**, que direciona cada chamada para a versão correta da função, eliminando a necessidade de condicionais explícitas como `if` ou `while`. Assim, temos funções específicas para:

- iniciar o processo (`tabuada/1`),
- processar a multiplicação (`tabuada/2`),
- e encerrar a recursão (`tabuada(_, 11)`).

O instrutor também propõe um desafio: **fazer a função retornar uma lista** com os resultados da tabuada, em vez de apenas imprimir no console — exercitando o uso de recursão e imutabilidade.

Por fim, foi introduzido o conceito de **tail recursion** (*recursão de cauda*), uma otimização do Elixir (herdada da Erlang) que evita o estouro da pilha quando a **última operação** de uma função é a chamada recursiva. Nesse caso, o compilador otimiza a execução como se fosse um loop interno, tornando o processo mais eficiente.

Em resumo, a recursividade em Elixir substitui os loops tradicionais, explorando:

- **Pattern matching** para definir condições de parada;
- **Imutabilidade** para garantir segurança e previsibilidade;
- **Tail recursion** para eficiência na execução.

A prática constante é fundamental para se acostumar com essa abordagem funcional de controle de fluxo.

## Libs

### Credo

A lib credo é uma ferramenta de análise estática para Elixir que ajuda a manter a qualidade do código, identificando problemas de estilo, complexidade e possíveis bugs.

#### Instalação

1. Adicione `{:credo, "~> 1.5", only: [:dev, :test], runtime: false}` na função `deps` do arquivo `mix.exs`.
2. Execute `mix deps.get` para baixar a dependência.
3. Execute `mix credo gen.config` para gerar o arquivo de configuração `.credo.exs`.

## Extensões para VSCode

- ElixirLS: Language Server para Elixir, oferecendo funcionalidades como autocompletar, linting, formatação e depuração.
- ElixirLint: Integração do Credo diretamente no VSCode, mostrando problemas de estilo e sugestões enquanto você digita. *Lembre-se de configurar a opção `elixirLinter.useStrict` para `true` nas configurações do VSCode para uma análise mais rigorosa.*

Perfeito — aqui está uma versão pronta e formatada para o teu **README.md**, no mesmo estilo didático que tu tens usado nos outros tópicos:

---

## Pipe Operator

O **operador pipe (`|>`)** é uma das construções mais elegantes e poderosas do Elixir.
Ele permite **encadear funções de forma legível**, passando automaticamente o resultado de uma expressão como **primeiro argumento** da próxima função.

No exemplo abaixo, o módulo `ReportsGenerator` utiliza o operador pipe para processar um arquivo de forma sequencial e clara:

```elixir
defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "❌ Error while opening file!"
end
```

Sem o pipe, o código acima ficaria assim:

```elixir
def build(filename) do
  handle_file(File.read("reports/#{filename}"))
end
```

O pipe simplesmente **remove a necessidade de aninhar chamadas de função**, tornando o fluxo de leitura mais natural — de cima para baixo, da esquerda para a direita.

### Como funciona

A expressão:

```elixir
"reports/#{filename}"
|> File.read()
|> handle_file()
```

é equivalente a:

```elixir
handle_file(File.read("reports/#{filename}"))
```

1. A string `"reports/#{filename}"` é passada como argumento para `File.read/1`.
2. O resultado de `File.read/1`, que pode ser `{:ok, conteúdo}` ou `{:error, motivo}`, é passado para `handle_file/1`.
3. A função `handle_file/1` decide o que fazer conforme o resultado.

### Benefícios

- **Legibilidade:** o fluxo de dados segue uma direção clara.
- **Menos parênteses:** facilita entender a ordem de execução.
- **Padronização:** muito usado em pipelines de dados (por exemplo, processamento de arquivos, requisições HTTP, e manipulação de coleções).

---

Aqui está um tópico completo e bem estruturado para o teu **README.md**, comparando e explicando as chamadas de funções **implícitas** e **explícitas** em Elixir:

---

## Chamadas de Funções Implícitas vs Explícitas

Em Elixir, há duas formas de passar funções como argumento para outras funções de ordem superior (como `Enum.map/2`, `Enum.filter/2`, etc.): a **forma explícita**, usando funções anônimas (`fn -> end`), e a **forma implícita**, usando a notação simplificada `&`.

Essas duas abordagens são equivalentes em funcionalidade, mas diferem em **legibilidade**, **estilo** e **intenção**.

### Forma Explícita

Na forma explícita, criamos uma **função anônima** usando a sintaxe `fn ... -> ... end`.
Isso é útil quando a função tem mais de uma expressão, ou quando queremos deixar o fluxo de execução mais claro.

```elixir
defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, fn elem -> String.to_integer(elem) end)
  end
end
```

Essa forma é **explícita**, pois definimos claramente a função anônima que será passada para `Enum.map/2` e para `List.update_at/3`.
Ela deixa evidente onde começa e termina a função que será aplicada a cada elemento.

---

### Forma Implícita

Na forma implícita, usamos o **operador `&`** (chamado de *capture operator*), que permite criar funções de forma concisa.

```elixir
defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.map(&parse_line(&1))
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
```

Aqui, `&parse_line(&1)` é uma forma curta de escrever `fn line -> parse_line(line) end`.
Da mesma forma, `&String.to_integer/1` captura a função `String.to_integer/1` e a passa diretamente, sem precisar declarar uma função anônima intermediária.

Essa sintaxe é **mais enxuta** e idiomática em Elixir, sendo recomendada quando a intenção da função é simples e direta.

---

### Comparação

| Aspecto             | Forma Explícita                                                       | Forma Implícita                                       |
| ------------------- | --------------------------------------------------------------------- | ----------------------------------------------------- |
| **Sintaxe**         | `fn x -> função(x) end`                                               | `&função(&1)`                                         |
| **Legibilidade**    | Mais clara para quem vem de linguagens imperativas                    | Mais concisa e idiomática para quem já domina Elixir  |
| **Uso recomendado** | Quando há múltiplas operações ou lógica mais extensa dentro da função | Quando é uma chamada simples, geralmente de uma linha |
| **Performance**     | Igual em tempo de execução                                            | Igual em tempo de execução                            |

---

### Conclusão

Ambas as formas são válidas — o importante é **usar a que torna o código mais legível** dentro do contexto.
Em código de produção, a forma implícita costuma ser preferida por sua concisão, especialmente em pipelines (`|>`), onde a clareza do fluxo é mais importante do que a estrutura da função em si.

> 💡 **Dica:** se a função anônima começa a ficar muito complexa, prefira a forma explícita ou extraia a lógica para uma função nomeada.

---

Perfeito — aqui vai um tópico pronto para o teu `README.md`, explicando **`Enum.into/2`** de forma clara e com exemplos práticos no mesmo estilo dos outros tópicos.

---

## Enum

O módulo `Enum` é uma das partes mais poderosas da linguagem Elixir.
Ele oferece funções para manipular coleções (listas, mapas, ranges, streams etc.) de forma **declarativa e funcional**.
Com `Enum`, é possível transformar, filtrar, reduzir e agregar dados sem usar laços imperativos.

Entre as muitas funções do módulo, uma das mais úteis é **`Enum.into/2`**, usada para **converter ou acumular coleções em outro tipo de estrutura**.

---

### Enum.into

A função `Enum.into/2` pega uma coleção enumerável (lista, mapa, stream etc.) e **a insere em outra coleção destino**, respeitando o formato do destino.
Em outras palavras, ela “transforma” uma enumeração em outro tipo de estrutura — por exemplo, de uma lista para um mapa, ou de um range para uma lista.

#### 📦 Estrutura

```elixir
Enum.into(enumerable, collectable)
```

- **`enumerable`** → é a fonte de dados, como uma lista, mapa, ou range.
- **`collectable`** → é a coleção destino, que vai receber os dados da fonte.

---

#### 💡 Exemplos básicos

##### 1. Convertendo um `Range` em `List`

```elixir
Enum.into(1..5, [])
# => [1, 2, 3, 4, 5]
```

Aqui, o range `1..5` é “inserido” dentro de uma lista vazia (`[]`), produzindo uma lista de números.

##### 2. Criando um `Map` a partir de uma lista de tuplas

```elixir
Enum.into([{:apple, 10}, {:banana, 20}], %{})
# => %{apple: 10, banana: 20}
```

A lista contém tuplas de chave/valor. O `Enum.into` transforma isso em um mapa.

##### 3. Adicionando elementos a um `Map` existente

```elixir
Enum.into([{:pear, 15}], %{apple: 10, banana: 20})
# => %{apple: 10, banana: 20, pear: 15}
```

O `Enum.into` também serve para “fundir” dados em uma estrutura já existente.

##### 4. Convertendo um `Map` em uma `List`

```elixir
Enum.into(%{a: 1, b: 2}, [])
# => [a: 1, b: 2]
```

O processo é inverso: o mapa vira uma lista de tuplas.

---

#### 🧠 Quando usar `Enum.into`

Use `Enum.into/2` quando você:

- Quer **converter** de um tipo de coleção para outro.
- Precisa **acumular** dados em uma estrutura existente (por exemplo, adicionar pares a um mapa).
- Está montando pipelines de transformação com o operador `|>` e quer terminar com um tipo específico.

---

#### 🚀 Exemplo prático com pipeline

```elixir
1..5
|> Enum.map(&(&1 * 2))
|> Enum.into([])
```

1. O `Range` `1..5` é transformado em `[2, 4, 6, 8, 10]` pelo `map`.
2. Depois, o `Enum.into` pega o resultado e garante que ele vire uma lista (útil quando o pipeline pode gerar outros tipos de coleção).

---

#### 🧩 Integração com o código do projeto

No contexto do teu projeto (como o `ReportsGenerator`), o `Enum.into/2` pode ser usado, por exemplo, para transformar o resultado de um `Stream` em um mapa:

```elixir
"reports/#{filename}"
|> File.stream!()
|> Enum.map(&parse_line/1)
|> Enum.into(%{})
```

Assim, cada linha do arquivo vira um item no mapa final, de forma elegante e funcional.

---

### 🧾 Resumo

| Função                          | O que faz                            | Exemplo         | Resultado       |
| ------------------------------- | ------------------------------------ | --------------- | --------------- |
| `Enum.into(1..3, [])`           | Converte Range em lista              | `[1, 2, 3]`     | `[1, 2, 3]`     |
| `Enum.into([{:a, 1}], %{})`     | Converte lista de tuplas em mapa     | `%{a: 1}`       | `%{a: 1}`       |
| `Enum.into(%{x: 9}, [])`        | Converte mapa em lista               | `[x: 9]`        | `[x: 9]`        |
| `Enum.into([{:y, 8}], %{x: 9})` | Adiciona elementos ao mapa existente | `%{x: 9, y: 8}` | `%{x: 9, y: 8}` |

---

Aqui está uma versão revisada e bem organizada da tua transcrição, já formatada para o **README.md** do teu repositório de estudos em Elixir, com explicação didática e tom de documentação técnica, sem perder o conteúdo original:

---

## Guard Clauses

As *guard clauses* (ou cláusulas de guarda) em Elixir permitem adicionar verificações extras a uma função, além do que o *pattern matching* já oferece. Elas são especialmente úteis quando queremos que uma função só seja executada sob certas condições mais específicas.

### Exemplo prático

O exemplo abaixo mostra a utilização de *guard clauses* dentro de um módulo simples de matemática:

```elixir
defmodule Module.Math do
  def somo(parametro1, parametro2), do: parametro1 + parametro2

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end
```

Nesse módulo, temos duas definições (ou *cláusulas*) para a mesma função `zero?/1`:

1. A primeira corresponde exatamente ao valor `0` — e retorna `true`.
2. A segunda é executada apenas se o parâmetro for um **inteiro diferente de zero**, retornando `false`.

Se passarmos qualquer valor que **não seja um inteiro**, nenhuma das cláusulas será compatível e o Elixir lançará um erro informando que *nenhuma função candidata foi encontrada*.

### Explicação detalhada

A linha:

```elixir
def zero?(x) when is_integer(x), do: false
```

introduz o uso do **`when`**, que adiciona uma condição de guarda à definição da função. Essa condição é avaliada *depois* do *pattern matching*, e só permite a execução da função se for verdadeira.

No caso, o `is_integer(x)` é uma função nativa do Elixir que retorna `true` se o valor for um número inteiro. Assim, `zero?/1` só aceita inteiros como argumento.

### O que acontece na prática

| Entrada                  | Resultado | Explicação                                     |
| ------------------------ | --------- | ---------------------------------------------- |
| `Module.Math.zero?(0)`   | `true`    | Casou com a primeira cláusula (`0`)            |
| `Module.Math.zero?(5)`   | `false`   | Casou com a segunda cláusula (`is_integer(x)`) |
| `Module.Math.zero?("a")` | **erro**  | Nenhuma cláusula compatível                    |

### Observações importantes

- As *guard clauses* podem usar diversas funções nativas que começam com `is_` (`is_integer/1`, `is_atom/1`, `is_list/1`, etc.).
- Também podem usar operadores aritméticos e lógicos simples (`+`, `-`, `>`, `<`, `and`, `or`...).
- Não é possível utilizar funções definidas pelo usuário dentro das *guard clauses*.

### Em resumo

As *guard clauses* permitem criar múltiplas versões da mesma função, cada uma com um comportamento específico baseado não só no formato do parâmetro (*pattern matching*), mas também em suas propriedades lógicas. Isso torna o código mais robusto, claro e seguro.

---
Aqui está o texto revisado e formatado em **markdown**, pronto para o teu `README.md` de estudos sobre **Elixir**, com título e subtítulos organizados, explicação didática e fiel à transcrição original.

---

## Parâmetros padrão

Em Elixir, podemos definir **valores padrão** para parâmetros de funções. Isso permite que uma função seja chamada com menos argumentos do que o total definido, pois os valores omitidos são substituídos automaticamente pelos padrões configurados.

### Exemplo prático

O exemplo abaixo mostra um módulo que concatena duas strings, podendo receber um separador opcional (por padrão, um espaço em branco) e até mesmo ser chamado com apenas uma string:

```elixir
defmodule Module.Concat do
  def join(string_a, string_b \\ nil, separador \\ " ")

  def join(string_a, string_b, _separador) when is_nil(string_b) do
    string_a
  end

  def join(string_a, string_b, separador) do
    string_a <> separador <> string_b
  end
end
```

### Explicação

A função `join/3` concatena duas strings (`string_a` e `string_b`) com um separador entre elas. O **valor padrão** do `separador` é `" "`, então é possível chamar:

```elixir
Module.Concat.join("Olá", "Mundo")
# => "Olá Mundo"
```

Se o separador for informado explicitamente, ele substitui o padrão:

```elixir
Module.Concat.join("Olá", "Mundo", "_")
# => "Olá_Mundo"
```

Além disso, é possível chamar a função com apenas **um parâmetro**, retornando diretamente o valor passado:

```elixir
Module.Concat.join("Olá")
# => "Olá"
```

Isso é possível graças à **cláusula de guarda** `when is_nil(string_b)`, que garante que, quando o segundo parâmetro for `nil`, apenas `string_a` será retornada.

### Cabeçalhos de função e múltiplas cláusulas

Quando uma função possui **múltiplas cláusulas** (várias definições para a mesma função), é comum que o Elixir apresente avisos se os **valores padrão** forem definidos em cada uma delas separadamente.
Para evitar repetições e melhorar a clareza, o Elixir permite definir **valores padrão apenas no cabeçalho** da função — ou seja, uma definição sem corpo, apenas a assinatura da função com seus padrões.

```elixir
def join(string_a, string_b \\ nil, separador \\ " ")
```

Isso indica ao compilador que **todas as cláusulas de `join/3`** compartilham esses mesmos valores padrão. Assim, as definições abaixo não precisam (e nem devem) repeti-los.

### Ordem de avaliação

O Elixir avalia as funções **de cima para baixo**, então a ordem das cláusulas importa.
No exemplo acima, a cláusula com a guarda `is_nil(string_b)` vem **antes** da cláusula que realiza a concatenação. Isso garante que, se o segundo parâmetro for `nil`, a primeira cláusula será executada imediatamente.

### Resumo

- Valores padrão são definidos com `\\`.
- Apenas uma das definições deve conter os valores padrão (no cabeçalho).
- É possível combinar valores padrão com cláusulas de guarda.
- A ordem das definições importa para o *pattern matching* e para as *guard clauses*.
- Parâmetros que não são utilizados podem ser prefixados com `_` para evitar avisos do compilador.

### Exemplos de uso

| Chamada                                   | Resultado     | Descrição                                 |
| ----------------------------------------- | ------------- | ----------------------------------------- |
| `Module.Concat.join("Olá")`               | `"Olá"`       | Retorna a própria string (sem `string_b`) |
| `Module.Concat.join("Olá", "Mundo")`      | `"Olá Mundo"` | Usa o separador padrão (`" "`)            |
| `Module.Concat.join("Olá", "Mundo", "_")` | `"Olá_Mundo"` | Usa o separador informado (`"_"`)         |

Aqui está o texto revisado e formatado em **markdown**, pronto para o teu `README.md` de estudos sobre **Elixir**, com foco em clareza, fluidez e fidelidade à transcrição original.

---

## Convenções de nome

O Elixir segue uma série de **convenções de nomenclatura** (naming conventions) que tornam o código mais legível, previsível e consistente entre diferentes projetos e desenvolvedores. Essas convenções não são obrigatórias, mas são amplamente utilizadas e incentivadas pela comunidade.

A documentação oficial sobre o tema está disponível em:
🔗 [Naming Conventions — Elixir](https://hexdocs.pm/elixir/1.12.3/naming-conventions.html)

---

### Casing — uso de maiúsculas e minúsculas

- **Funções e variáveis** devem ser nomeadas em **snake_case**, ou seja, palavras em minúsculas separadas por *underscore* (`_`).
  Exemplo: `soma_valores`, `total_usuarios`.

- **Módulos** seguem a convenção **CamelCase**, com a primeira letra de cada palavra em maiúscula.
  Exemplo: `MeuModulo.Math`.

Na prática, o módulo `MeuModulo.Math` pode estar em um arquivo chamado `meu_modulo_math.ex`.
O nome do arquivo deve seguir **snake_case**, enquanto o nome do módulo segue **CamelCase**.

---

### Uso do underscore (`_`)

O underscore tem usos específicos e importantes:

1. **Ignorar valores** — quando um parâmetro ou variável não será utilizado, prefixa-se com `_`.
   Exemplo:

   ```elixir
   def soma(a, _b), do: a
   ```

   Isso evita avisos do compilador sobre variáveis não utilizadas.

2. **Funções privadas não importáveis** — funções que começam com `_` não são importadas automaticamente quando o módulo é usado em outro arquivo.
   Exemplo:

   ```elixir
   defmodule Example do
     def _hidden_function, do: :ok
   end
   ```

   Mesmo que `Example` seja importado, `_hidden_function` só pode ser chamada explicitamente (`Example._hidden_function/0`).

---

### Pontuação em nomes de funções

Elixir permite o uso de **!** e **?** no final dos nomes de função, com significados convencionais importantes:

#### Funções terminadas com `!`

Indicam que podem **lançar erros** (exceções), ao invés de apenas retornar tuplas de resultado.

Exemplo:

```elixir
File.read("arquivo.txt")   # => {:ok, "conteúdo"} ou {:error, :enoent}
File.read!("arquivo.txt")  # => "conteúdo" ou levanta erro se falhar
```

Use a versão sem `!` quando quiser **tratar erros manualmente**, e a versão com `!` quando quiser **falhar imediatamente** caso algo dê errado.

#### Funções terminadas com `?`

Indicam que retornam **valores booleanos** (`true` ou `false`).

Exemplo:

```elixir
Enum.empty?([])
# => true
```

---

### `is_` vs `?` em funções booleanas

Há duas convenções principais para funções que retornam valores booleanos:

- **Funções nativas** da linguagem geralmente começam com `is_` (ex.: `is_integer/1`, `is_nil/1`) e podem ser usadas em **cláusulas de guarda** (`when`).
- **Funções definidas por nós** geralmente terminam com `?` (ex.: `ativo?`, `zero?`), pois **não podem ser usadas** em guard clauses.

Exemplo:

```elixir
def zero?(0), do: true
def zero?(_), do: false
```

---

### `size` vs `length`

Essas palavras têm significados distintos e refletem diferenças de desempenho:

- `size` → operação **constante** (O(1)), pois o tamanho já é armazenado na estrutura.
  Exemplo: `tuple_size/1`, `map_size/1`.

- `length` → operação **linear** (O(n)), pois precisa percorrer todos os elementos.
  Exemplo: `length/1` em listas e strings.

```elixir
tuple_size({1, 2, 3})  # rápido, tempo constante
length([1, 2, 3])      # percorre a lista inteira
```

Saber essa diferença ajuda a entender o impacto de performance das suas escolhas.

---

### Resumo das principais convenções

| Elemento                 | Convenção        | Exemplo             | Observação                               |
| ------------------------ | ---------------- | ------------------- | ---------------------------------------- |
| **Módulos**              | `CamelCase`      | `MeuModulo.Exemplo` | Primeira letra de cada palavra maiúscula |
| **Funções e variáveis**  | `snake_case`     | `soma_valores`      | Sempre minúsculas                        |
| **Ignorar parâmetro**    | Prefixar com `_` | `_valor`            | Evita avisos                             |
| **Função booleana**      | Terminar com `?` | `ativo?`            | Retorna `true` ou `false`                |
| **Função perigosa**      | Terminar com `!` | `File.read!`        | Pode lançar erro                         |
| **Constante de tamanho** | `size`           | `map_size(map)`     | Tempo constante                          |
| **Comprimento**          | `length`         | `length(lista)`     | Tempo linear                             |

---

## Objetivo

Este repositório serve como apoio para quem deseja aprender Elixir, praticar conceitos fundamentais e acompanhar aulas em vídeo sobre a linguagem.

---
