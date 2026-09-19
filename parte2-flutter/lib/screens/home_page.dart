import 'package:flutter/material.dart';

import '../models/colecao_jogos.dart';
import '../models/jogo.dart';
import '../data/colecao_exemplo.dart';
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
    colecao = criarColecaoInicial();
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
