import 'jogo.dart';

class JogoDigital extends Jogo {
  final String lojaDigital;
  final double tamanhoGB;

  JogoDigital({
    required super.titulo,
    required super.anoLancamento,
    super.precoPago,
    required super.dataAquisicao,
    required String lojaDigital,
    required double tamanhoGB,
  })  : lojaDigital = _validarLoja(lojaDigital),
        tamanhoGB = _validarTamanho(tamanhoGB);

  @override
  String descricao() {
    return '${super.descricao()} | Loja: $lojaDigital | Tamanho: '
        '${tamanhoGB.toStringAsFixed(1).replaceAll('.', ',')} GB';
  }

  static String _validarLoja(String valor) {
    final lojaTratada = valor.trim();
    if (lojaTratada.isEmpty) {
      throw ArgumentError.value(valor, 'lojaDigital', 'deve ser informada.');
    }
    return lojaTratada;
  }

  static double _validarTamanho(double valor) {
    if (!valor.isFinite || valor < 0) {
      throw ArgumentError.value(
        valor,
        'tamanhoGB',
        'deve ser finito e maior ou igual a zero.',
      );
    }
    return valor;
  }
}
