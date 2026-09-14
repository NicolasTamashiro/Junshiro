import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameshelf/data/colecao_exemplo.dart';
import 'package:gameshelf/models/jogo.dart';
import 'package:gameshelf/screens/home_page.dart';
import 'package:gameshelf/screens/widgets/jogo_card.dart';

void main() {
  test('a coleção inicial possui seis jogos e total de 219 reais', () {
    final colecao = criarColecaoExemplo();

    expect(colecao.jogos, hasLength(6));
    expect(colecao.totalGasto, 219);
  });

  testWidgets('a coleção mostra total e permite rolar até o sexto jogo', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.text('Minha coleção'), findsOneWidget);
    expect(find.text('R\$ 219,00'), findsOneWidget);
    expect(find.text('Hades'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Terraria'), findsOneWidget);
  });

  testWidgets('um título longo continua dentro do cartão', (tester) async {
    final jogo = Jogo(
      titulo:
          'Um título de jogo muito longo para verificar a leitura do cartão',
      anoLancamento: 2026,
      precoPago: 10,
      dataAquisicao: DateTime(2026, 9, 13),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: JogoCard(jogo: jogo)),
      ),
    );

    expect(find.text(jogo.titulo), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
