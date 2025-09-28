# Estudos em Elixir

Este repositório reúne exemplos e materiais para aprender e praticar Elixir, uma linguagem funcional, concorrente e escalável desenvolvida para criar aplicações robustas e distribuídas.

- [Estudos em Elixir](#estudos-em-elixir)
  - [Sobre Elixir](#sobre-elixir)
  - [Estrutura do Repositório](#estrutura-do-repositório)
  - [Como executar exemplos](#como-executar-exemplos)
  - [Como importar um arquivo no IEx](#como-importar-um-arquivo-no-iex)
  - [Macros](#macros)
  - [Pattern Matching](#pattern-matching)
  - [Objetivo](#objetivo)

## Sobre Elixir

Elixir é uma linguagem de programação funcional que roda na máquina virtual Erlang (BEAM). Ela é conhecida por sua sintaxe expressiva, suporte nativo à concorrência, tolerância a falhas e facilidade para construir sistemas distribuídos e de alta disponibilidade.

Principais características:

- **Imutabilidade:** Os dados em Elixir são imutáveis, promovendo segurança e previsibilidade.
- **Concorrência:** Utiliza o modelo de atores do Erlang para criar processos leves e paralelos.
- **Escalabilidade:** Projetada para aplicações que exigem alta performance e disponibilidade.
- **Sintaxe moderna:** Inspirada em Ruby, tornando o código mais legível.

## Estrutura do Repositório

- [`math.exs`](math.exs): Exemplo de módulo com função de soma.
- [`teste.exs`](teste.exs): Demonstra importação, alias e sobrescrita de funções.
- `03-Mais Tipos/`: Vídeos sobre tipos de dados em Elixir.
- `04-Modulos/`: Vídeos sobre módulos e aliases.

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


## Objetivo

Este repositório serve como apoio para quem deseja aprender Elixir, praticar conceitos fundamentais e acompanhar aulas em vídeo sobre a linguagem.

---
