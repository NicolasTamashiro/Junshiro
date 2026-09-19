# Junshiro

Projeto desenvolvido para a disciplina de Programação para Dispositivos Móveis,
no 4º semestre de Engenharia de Software. O Junshiro organiza uma coleção
pessoal de jogos.

## Integrantes

- Nicolas Yuji Tamashiro
- Felipe Junji Goto

## Domínio

O domínio do projeto é uma coleção de jogos. `Jogo` representa cada item da
coleção e `ColecaoJogos` agrupa diversos jogos em uma `List<Jogo>`; portanto,
a relação entre as classes é de composição, e não de herança. `JogoDigital` é
uma especialização de `Jogo` que acrescenta informações próprias, como loja
digital e tamanho do arquivo.

O trabalho possui duas partes: `parte1-dart`, com a demonstração em Dart puro,
e `parte2-flutter`, com a interface do aplicativo. As classes de domínio são
mantidas idênticas nos dois projetos, como solicitado no enunciado.

## Tabela de rastreio

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/jogo.dart:1` | Bloco `[1]` do relatório |
| 2 | Herança | `parte1-dart/bin/models/jogo_digital.dart:3` | Bloco `[2]` do relatório |
| 3 | Composição | `parte1-dart/bin/models/colecao_jogos.dart:3` | Bloco `[3]` do relatório |
| 4 | Encapsulamento | `parte1-dart/bin/models/colecao_jogos.dart:13` | Bloco `[4]` e o total no topo da tela de lista |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:43` | AppBar e corpo da tela inicial |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/jogo_card.dart:17` | Cada item da lista |
| 7 | Lista | `parte2-flutter/lib/screens/home_page.dart:68` | Lista rolável com seis itens |
| 8 | Navegação | `parte2-flutter/lib/screens/home_page.dart:27` | Toque no item abre o detalhe |
| 9 | Formulário | `parte2-flutter/lib/screens/cadastro_page.dart:56` | Tela de cadastro com três campos |
| 10 | Estado | `parte2-flutter/lib/screens/home_page.dart:38` | Item novo na lista e total atualizado |
