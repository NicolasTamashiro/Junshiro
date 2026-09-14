import 'package:flutter/material.dart';

import '../models/jogo.dart';
import '../models/jogo_digital.dart';

class DetalhePage extends StatelessWidget {
  final Jogo jogo;

  const DetalhePage({super.key, required this.jogo});

  @override
  Widget build(BuildContext context) {
    final digital = jogo is JogoDigital ? jogo as JogoDigital : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do jogo')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(jogo.titulo, style: Theme.of(context).textTheme.headlineMedium),
            Text('Preço: ${formatarReais(jogo.precoPago)}'),
            const SizedBox(height: 20),
            Text('Ano: ${jogo.anoLancamento}'),
            Text('Aquisição: ${formatarData(jogo.dataAquisicao)}'),
            if (digital != null) ...[
              Text('Loja: ${digital.lojaDigital}'),
              Text('Tamanho: ${digital.tamanhoGB} GB'),
            ],
            const SizedBox(height: 20),
            Text(jogo.descricao()),
          ],
        ),
      ),
    );
  }
}

String formatarReais(double valor) =>
    'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';

String formatarData(DateTime data) =>
    '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
