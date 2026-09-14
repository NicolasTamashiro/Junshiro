import '../models/colecao_jogos.dart';
import '../models/jogo.dart';
import '../models/jogo_digital.dart';

ColecaoJogos criarColecaoExemplo() {
  return ColecaoJogos(
    nome: 'Minha coleção',
    jogos: [
      JogoDigital(
        titulo: 'Hades',
        anoLancamento: 2020,
        precoPago: 50,
        dataAquisicao: DateTime(2026, 9, 1),
        lojaDigital: 'Steam',
        tamanhoGB: 15,
      ),
      Jogo(
        titulo: 'Hollow Knight',
        anoLancamento: 2017,
        precoPago: 30,
        dataAquisicao: DateTime(2026, 9, 2),
      ),
      JogoDigital(
        titulo: 'Celeste',
        anoLancamento: 2018,
        precoPago: 25,
        dataAquisicao: DateTime(2026, 9, 3),
        lojaDigital: 'Steam',
        tamanhoGB: 1.2,
      ),
      Jogo(
        titulo: 'Stardew Valley',
        anoLancamento: 2016,
        precoPago: 40,
        dataAquisicao: DateTime(2026, 9, 4),
      ),
      JogoDigital(
        titulo: 'Portal 2',
        anoLancamento: 2011,
        precoPago: 20,
        dataAquisicao: DateTime(2026, 9, 5),
        lojaDigital: 'Steam',
        tamanhoGB: 8,
      ),
      Jogo(
        titulo: 'Terraria',
        anoLancamento: 2011,
        precoPago: 54,
        dataAquisicao: DateTime(2026, 9, 6),
      ),
    ],
  );
}
