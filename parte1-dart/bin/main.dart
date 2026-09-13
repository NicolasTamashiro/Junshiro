import 'models/colecao_jogos.dart';
import 'models/jogo.dart';
import 'models/jogo_digital.dart';

void main() {
  final jogoFisico = Jogo(
    titulo: 'Hades',
    anoLancamento: 2020,
    precoPago: 50,
    dataAquisicao: DateTime(2024, 2, 10),
  );
  final jogoDigital = JogoDigital(
    titulo: 'Celeste',
    anoLancamento: 2018,
    precoPago: 25,
    dataAquisicao: DateTime(2024, 4, 5),
    lojaDigital: 'Steam',
    tamanhoGB: 1.2,
  );
  final colecao = ColecaoJogos(
    nome: 'Minha colecao',
    jogos: [
      jogoFisico,
      Jogo(
        titulo: 'Hollow Knight',
        anoLancamento: 2017,
        precoPago: 30,
        dataAquisicao: DateTime(2024, 3, 8),
      ),
      jogoDigital,
      JogoDigital(
        titulo: 'Stardew Valley',
        anoLancamento: 2016,
        precoPago: 40,
        dataAquisicao: DateTime(2024, 5, 12),
        lojaDigital: 'GOG',
        tamanhoGB: 0.6,
      ),
      Jogo(
        titulo: 'Portal 2',
        anoLancamento: 2011,
        precoPago: 20,
        dataAquisicao: DateTime(2024, 6, 1),
      ),
      JogoDigital(
        titulo: 'Terraria',
        anoLancamento: 2011,
        precoPago: 54,
        dataAquisicao: DateTime(2024, 7, 20),
        lojaDigital: 'Steam',
        tamanhoGB: 0.2,
      ),
    ],
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(jogoFisico.descricao());

  print('\n===== [2] HERANÇA =====');
  print(jogoFisico.descricao());
  print(jogoDigital.descricao());

  print('\n===== [3] COMPOSIÇÃO =====');
  print('Coleção: ${colecao.nome}');
  print('Quantidade: ${colecao.jogos.length}');
  for (final jogo in colecao.jogos) {
    print('- ${jogo.titulo}');
  }

  print('\n===== [4] ENCAPSULAMENTO =====');
  print('Total calculado antes: ${formatarReais(colecao.totalGasto)}');
  colecao.adicionar(
    Jogo(
      titulo: 'Jogo de demonstracao',
      anoLancamento: 2026,
      precoPago: 50,
      dataAquisicao: DateTime(2026, 9, 10),
    ),
  );
  print(
      'Após adicionar jogo de R\$ 50,00: ${formatarReais(colecao.totalGasto)}');
}

String formatarReais(double valor) =>
    'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
