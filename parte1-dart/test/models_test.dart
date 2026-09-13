import 'package:test/test.dart';

import '../bin/models/colecao_jogos.dart';
import '../bin/models/jogo.dart';
import '../bin/models/jogo_digital.dart';

void main() {
  final data = DateTime(2024, 1, 1);

  Jogo criarJogo({
    String titulo = 'Teste',
    int anoLancamento = 2024,
    double precoPago = 10,
  }) {
    return Jogo(
      titulo: titulo,
      anoLancamento: anoLancamento,
      precoPago: precoPago,
      dataAquisicao: data,
    );
  }

  group('Jogo', () {
    test('remove espaços das extremidades e aceita preço zero', () {
      final jogo = criarJogo(titulo: '  Celeste  ', precoPago: 0);

      expect(jogo.titulo, 'Celeste');
      expect(jogo.precoPago, 0);
    });

    test('rejeita título vazio e ano inválido', () {
      expect(() => criarJogo(titulo: '   '), throwsArgumentError);
      expect(() => criarJogo(anoLancamento: 0), throwsArgumentError);
      expect(() => criarJogo(anoLancamento: -1), throwsArgumentError);
    });

    test('rejeita preços negativos ou não finitos', () {
      expect(() => criarJogo(precoPago: -0.01), throwsArgumentError);
      expect(() => criarJogo(precoPago: double.nan), throwsArgumentError);
      expect(
        () => criarJogo(precoPago: double.infinity),
        throwsArgumentError,
      );
    });
  });

  group('JogoDigital', () {
    test('especializa a descrição com loja e tamanho', () {
      final jogo = JogoDigital(
        titulo: 'Celeste',
        anoLancamento: 2018,
        precoPago: 25,
        dataAquisicao: data,
        lojaDigital: ' Steam ',
        tamanhoGB: 1.2,
      );

      expect(jogo, isA<Jogo>());
      expect(jogo.lojaDigital, 'Steam');
      expect(jogo.descricao(), contains('Loja: Steam'));
      expect(jogo.descricao(), contains('Tamanho: 1,2 GB'));
    });

    test('rejeita loja vazia e tamanho inválido', () {
      expect(
        () => JogoDigital(
          titulo: 'Teste',
          anoLancamento: 2024,
          dataAquisicao: data,
          lojaDigital: ' ',
          tamanhoGB: 1,
        ),
        throwsArgumentError,
      );
      expect(
        () => JogoDigital(
          titulo: 'Teste',
          anoLancamento: 2024,
          dataAquisicao: data,
          lojaDigital: 'Steam',
          tamanhoGB: double.negativeInfinity,
        ),
        throwsArgumentError,
      );
    });
  });

  group('ColecaoJogos', () {
    test('calcula o total antes e depois de adicionar', () {
      final colecao = ColecaoJogos(
        nome: ' Minha coleção ',
        jogos: [criarJogo(precoPago: 219)],
      );

      expect(colecao.nome, 'Minha coleção');
      expect(colecao.totalGasto, 219);

      colecao.adicionar(criarJogo(titulo: 'Novo', precoPago: 50));
      expect(colecao.totalGasto, 269);
      expect(colecao.jogos, hasLength(2));
    });

    test('retorna zero quando está vazia', () {
      final colecao = ColecaoJogos(nome: 'Vazia');

      expect(colecao.totalGasto, 0);
      expect(colecao.jogos, isEmpty);
    });

    test('copia a entrada e não permite mutar a lista exposta', () {
      final entrada = [criarJogo()];
      final colecao = ColecaoJogos(nome: 'Coleção', jogos: entrada);

      entrada.add(criarJogo(titulo: 'Fora da coleção'));
      expect(colecao.jogos, hasLength(1));
      expect(
        () => colecao.jogos.add(criarJogo(titulo: 'Mutação externa')),
        throwsUnsupportedError,
      );
    });

    test('rejeita nome vazio', () {
      expect(() => ColecaoJogos(nome: '  '), throwsArgumentError);
    });
  });
}
