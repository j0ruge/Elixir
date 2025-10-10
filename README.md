# Estudos em Elixir

Este repositório reúne exemplos e materiais para aprender e praticar Elixir, uma linguagem funcional, concorrente e escalável desenvolvida para criar aplicações robustas e distribuídas.

- [Estudos em Elixir](#estudos-em-elixir)
  - [Sobre Elixir](#sobre-elixir)
  - [Como criar um novo projeto Elixir](#como-criar-um-novo-projeto-elixir)
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

1. **Instale o Elixir:** Certifique-se de ter o Elixir instalado em sua máquina. Você pode verificar isso executando `elixir -v` no terminal.
2. **Crie um novo projeto:** Use o comando `mix new nome_do_projeto` para criar um novo projeto. Substitua `nome_do_projeto` pelo nome desejado para o seu projeto.

   ```sh
   mix new meu_projeto
   ```

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

## Objetivo

Este repositório serve como apoio para quem deseja aprender Elixir, praticar conceitos fundamentais e acompanhar aulas em vídeo sobre a linguagem.

---
