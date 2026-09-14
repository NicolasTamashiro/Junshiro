import 'package:flutter/material.dart';

import '../models/jogo.dart';
import '../models/jogo_digital.dart';
import '../utils/formatadores.dart';

class DetalhePage extends StatelessWidget {
  final Jogo jogo;

  const DetalhePage({super.key, required this.jogo});

  @override
  Widget build(BuildContext context) {
    final jogoDigital = jogo is JogoDigital ? jogo as JogoDigital : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do jogo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jogo.titulo,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              formatarReais(jogo.precoPago),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            _LinhaDetalhe(
              rotulo: 'Ano de lançamento',
              valor: '${jogo.anoLancamento}',
            ),
            _LinhaDetalhe(
              rotulo: 'Data de aquisição',
              valor: formatarData(jogo.dataAquisicao),
            ),
            if (jogoDigital != null) ...[
              _LinhaDetalhe(
                rotulo: 'Loja digital',
                valor: jogoDigital.lojaDigital,
              ),
              _LinhaDetalhe(
                rotulo: 'Tamanho',
                valor:
                    '${jogoDigital.tamanhoGB.toStringAsFixed(1).replaceAll('.', ',')} GB',
              ),
            ],
            const SizedBox(height: 16),
            Text('Descrição', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(jogo.descricao()),
          ],
        ),
      ),
    );
  }
}

class _LinhaDetalhe extends StatelessWidget {
  final String rotulo;
  final String valor;

  const _LinhaDetalhe({required this.rotulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(rotulo, style: Theme.of(context).textTheme.labelLarge),
          Text(valor),
        ],
      ),
    );
  }
}
