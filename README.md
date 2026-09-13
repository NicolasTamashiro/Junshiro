# Junshiro — GameShelf

GameShelf é uma coleção de jogos: Jogo representa uma aquisição, JogoDigital é uma especialização
e ColecaoJogos agrupa vários jogos. A coleção contém jogos, por isso a relação é composição.

## Estado do projeto

**Etapa atual: inicialização e planejamento SDD concluídos; implementação da aplicação pendente.**

GitHub Spec Kit 1.0.5 foi inicializado neste clone com integração Codex em modo skills e scripts
PowerShell. A constituição, especificação, plano, modelo de dados, contrato de interface e
tarefas estão disponíveis. Ainda não existem os projetos executáveis de Dart e Flutter.

- Aplicativo: GameShelf — Minha coleção de jogos.
- Repositório: [NicolasTamashiro/Junshiro](https://github.com/NicolasTamashiro/Junshiro).
- Integrantes acadêmicos: a informar pelo usuário antes da entrega.
- Trabalho: Programação para Dispositivos Móveis, 4º ESW B, primeiro bimestre.
- Enunciado: [trabalho-bimestral](https://github.com/gustavo96ma/4ESWB_2026_2/tree/main/trabalho-bimestral).
- Prazo informado no enunciado: 18/09/2026; apresentação antes, conforme combinado em sala.

## Documentos para começar

1. [Constituição](.specify/memory/constitution.md): regras e restrições do projeto.
2. [Especificação](specs/001-gameshelf-collection/spec.md): jornadas, requisitos e critérios de aceitação.
3. [Plano técnico](specs/001-gameshelf-collection/plan.md): estrutura Dart/Flutter e recursos dos dez exercícios.
4. [Modelo de dados](specs/001-gameshelf-collection/data-model.md): campos, regras e relações.
5. [Contrato da interface](specs/001-gameshelf-collection/contracts/interface.md): telas e relatório.
6. [Tarefas](specs/001-gameshelf-collection/tasks.md): 28 atividades pendentes de implementação.
7. [Guia de execução](specs/001-gameshelf-collection/quickstart.md): preparação e roteiro de aceitação.
8. [Validação](specs/001-gameshelf-collection/validation.md): o que foi conferido e o que não foi executado.

## Aplicativo planejado

Três telas: coleção, detalhe e cadastro. A coleção abre com seis jogos e total fictício de R$ 219,00.
O detalhe mostra ano e data de aquisição, além dos dados digitais quando aplicáveis. O cadastro tem
somente título, ano e preço; ao cadastrar um jogo de R$ 50,00, a lista terá sete jogos e total R$ 269,00.
Dados ficam em memória durante a execução. Não há login no app, banco, APIs ou capas remotas.

## Fluxo com Spec Kit

As habilidades oficiais estão em .agents/skills. A feature ativa está registrada em
.specify/feature.json, independente da branch de Git. A branch real continua main.

Sequência usada: speckit-constitution → speckit-specify → speckit-plan → speckit-tasks.
A implementação deverá seguir speckit-implement e depois speckit-converge, atualizando apenas
tarefas com evidência de conclusão. As habilidades devem ser usadas a partir da raiz deste projeto.

Referências: [Spec Kit](https://github.com/github/spec-kit) e
[release 1.0.5](https://github.com/github/spec-kit/releases/tag/v1.0.5).
A inicialização utilizou a distribuição oficial specify-cli 1.0.5; os modelos versionados vieram dela.

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
| 5 | Estrutura de tela | Pendente — T014/T015 | AppBar e Column com dois alinhamentos |
| 6 | Cartão | Pendente — T013 | Container com BoxDecoration |
| 7 | Lista | Pendente — T011/T014 | seis jogos em ListView.builder |
| 8 | Navegação | Pendente — T017/T018 | detalhe do item selecionado |
| 9 | Formulário | Pendente — T020/T021/T022 | três campos e confirmação |
| 10 | Estado | Pendente — T023/T024 | sétimo jogo e total atualizado |

## Autoria e uso de ferramentas

O planejamento foi preparado com assistência de IA e GitHub Spec Kit. O enunciado permite esse
uso, exigindo que os integrantes compreendam e expliquem o trabalho. Preços, datas de aquisição
e tamanhos usados nos exemplos são fictícios para fins de demonstração.
