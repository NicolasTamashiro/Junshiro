import 'package:flutter/material.dart';

import '../models/colecao_jogos.dart';
import '../models/jogo.dart';
import '../models/jogo_digital.dart';
import 'cadastro_page.dart';
import 'detalhe_page.dart';
import 'widgets/jogo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ColecaoJogos colecao;

  @override
  void initState() {
    super.initState();
    colecao = ColecaoJogos(
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

  void abrirDetalhe(Jogo jogo) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetalhePage(jogo: jogo)),
    );
  }

  Future<void> abrirCadastro() async {
    final jogo = await Navigator.of(context).push<Jogo>(
      MaterialPageRoute(builder: (_) => const CadastroPage()),
    );

    if (!mounted || jogo == null) return;
    setState(() => colecao.adicionar(jogo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Junshiro')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: abrirCadastro,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar jogo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(colecao.nome, style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'Total: ${formatarReais(colecao.totalGasto)}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: colecao.jogos.length,
              itemBuilder: (context, indice) {
                final jogo = colecao.jogos[indice];
                return JogoCard(
                  jogo: jogo,
                  aoTocar: () => abrirDetalhe(jogo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

String formatarReais(double valor) =>
    'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
