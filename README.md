# Junshiro — GameShelf

GameShelf é uma coleção de jogos: Jogo representa uma aquisição, JogoDigital é uma especialização
e ColecaoJogos agrupa vários jogos. A coleção contém jogos, por isso a relação é composição.

## Estado do projeto

**Etapa atual: inicialização e planejamento SDD concluídos; implementação da aplicação pendente.**

GitHub Spec Kit 1.0.5 foi inicializado neste clone com integração Codex em modo skills e scripts
PowerShell. A constituição, especificação, plano, modelo de dados, contrato de interface e
tarefas estão disponíveis. Ainda não existem os projetos executáveis de Dart e Flutter.

- Aplicativo: GameShelf — Minha coleção de jogos.
- Integrantes: Nicolas Yuji Tamashiro e Felipe Junji Goto
- Trabalho: Programação para Dispositivos Móveis, 4º ESW B, primeiro bimestre.
- Prazo informado: 18/09/2026.

## Aplicativo planejado

Três telas: coleção, detalhe e cadastro. A coleção abre com seis jogos e total fictício de R$ 219,00.
O detalhe mostra ano e data de aquisição, além dos dados digitais quando aplicáveis. O cadastro tem
somente título, ano e preço; ao cadastrar um jogo de R$ 50,00, a lista terá sete jogos e total R$ 269,00.
Dados ficam em memória durante a execução. Não há login no app, banco, APIs ou capas remotas.

## Preparação do ambiente

Flutter e Dart não foram encontrados no PATH nem nos locais usuais consultados. Instale o
[Flutter SDK oficial](https://docs.flutter.dev/install), que inclui Dart, e siga o guia de execução.
A versão efetivamente instalada deve ser anotada na validação. Não há teste de aplicação executado.

O remoto foi confirmado como NicolasTamashiro/Junshiro. O Windows impediu a consulta das
credenciais do GitHub CLI e a escrita de uma nova branch em .git/refs; o login não foi confirmado
nesta sessão. Nenhuma conta global foi modificada e nenhum commit ou envio ao remoto foi realizado.

**Nada deve ser enviado ao remoto sem aprovação explícita do usuário.**

## Tabela de rastreio — planejamento

Esta tabela ainda não é a tabela final de entrega. Arquivos e linhas reais serão preenchidos
após implementação e formatação; não se deve apresentar caminhos planejados como evidência pronta.

| # | Exercício | Arquivo e linha | Evidência esperada |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/jogo.dart:1`; `parte1-dart/bin/main.dart:56` | bloco [1], quatro atributos |
| 2 | Herança | `parte1-dart/bin/models/jogo_digital.dart:3`; `parte1-dart/bin/main.dart:59` | bloco [2], descrições do pai e da filha |
| 3 | Composição | `parte1-dart/bin/models/colecao_jogos.dart:3`; `parte1-dart/bin/main.dart:63` | bloco [3], contagem e títulos |
| 4 | Encapsulamento | `parte1-dart/bin/models/colecao_jogos.dart:11`; `parte1-dart/bin/main.dart:70` | bloco [4] e total no topo |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:33`; `parte2-flutter/lib/main.dart:9` | AppBar e Column com dois alinhamentos |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/jogo_card.dart:6`; `parte2-flutter/lib/screens/widgets/jogo_card.dart:21` | Container com BoxDecoration |
| 7 | Lista | `parte2-flutter/lib/screens/home_page.dart:71` | seis jogos em ListView.builder |
| 8 | Navegação | `parte2-flutter/lib/screens/home_page.dart:28`; `parte2-flutter/lib/screens/detalhe_page.dart:7` | detalhe de item do meio |
| 9 | Formulário | Pendente — T020/T021/T022 | três campos e confirmação |
| 10 | Estado | Pendente — T023/T024 | sétimo jogo e total atualizado |
