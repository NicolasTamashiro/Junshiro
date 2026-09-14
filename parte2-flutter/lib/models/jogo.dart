class Jogo {
  final String titulo;
  final int anoLancamento;
  final double precoPago;
  final DateTime dataAquisicao;

  Jogo({
    required String titulo,
    required int anoLancamento,
    double precoPago = 0,
    required this.dataAquisicao,
  }) : titulo = _validarTitulo(titulo),
       anoLancamento = _validarAno(anoLancamento),
       precoPago = _validarPreco(precoPago);

  String descricao() {
    return 'Jogo: $titulo | Ano: $anoLancamento | Preço pago: R\$ '
        '${precoPago.toStringAsFixed(2).replaceAll('.', ',')} | Aquisição: '
        '${dataAquisicao.day.toString().padLeft(2, '0')}/'
        '${dataAquisicao.month.toString().padLeft(2, '0')}/'
        '${dataAquisicao.year}';
  }

  static String _validarTitulo(String valor) {
    final tituloTratado = valor.trim();
    if (tituloTratado.isEmpty) {
      throw ArgumentError.value(valor, 'titulo', 'deve ser informado.');
    }
    return tituloTratado;
  }

  static int _validarAno(int valor) {
    if (valor <= 0) {
      throw ArgumentError.value(
        valor,
        'anoLancamento',
        'deve ser um inteiro maior que zero.',
      );
    }
    return valor;
  }

  static double _validarPreco(double valor) {
    if (!valor.isFinite || valor < 0) {
      throw ArgumentError.value(
        valor,
        'precoPago',
        'deve ser finito e maior ou igual a zero.',
      );
    }
    return valor;
  }
}
