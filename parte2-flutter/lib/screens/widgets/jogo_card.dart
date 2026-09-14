import 'package:flutter/material.dart';

import '../../models/jogo.dart';

class JogoCard extends StatelessWidget {
  final Jogo jogo;
  final VoidCallback aoTocar;

  const JogoCard({super.key, required this.jogo, required this.aoTocar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Key('jogo-card-${jogo.titulo}'),
      borderRadius: BorderRadius.circular(16),
      onTap: aoTocar,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF28203C),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.videogame_asset_rounded, color: Color(0xFFB99CFF)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                jogo.titulo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              formatarReais(jogo.precoPago),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

String formatarReais(double valor) =>
    'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
