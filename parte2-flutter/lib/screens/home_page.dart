import 'package:flutter/material.dart';

import '../data/colecao_exemplo.dart';
import '../models/colecao_jogos.dart';
import '../models/jogo.dart';
import '../utils/formatadores.dart';
import 'detalhe_page.dart';
import 'widgets/jogo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ColecaoJogos _colecao;

  @override
  void initState() {
    super.initState();
    _colecao = criarColecaoExemplo();
  }

  void _abrirDetalhe(Jogo jogo) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => DetalhePage(jogo: jogo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GameShelf'), centerTitle: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _colecao.nome,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF38265F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total gasto na coleção'),
                      const SizedBox(height: 4),
                      Text(
                        formatarReais(_colecao.totalGasto),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _colecao.jogos.length,
              itemBuilder: (context, indice) {
                final jogo = _colecao.jogos[indice];
                return JogoCard(jogo: jogo, aoTocar: () => _abrirDetalhe(jogo));
              },
            ),
          ),
        ],
      ),
    );
  }
}
