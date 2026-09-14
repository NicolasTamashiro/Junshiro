import 'jogo.dart';

class ColecaoJogos {
  final String nome;
  final List<Jogo> _jogos;

  ColecaoJogos({required String nome, Iterable<Jogo> jogos = const []})
    : nome = _validarNome(nome),
      _jogos = List<Jogo>.from(jogos);

  List<Jogo> get jogos => List<Jogo>.unmodifiable(_jogos);

  double get totalGasto =>
      _jogos.fold(0.0, (total, jogo) => total + jogo.precoPago);

  void adicionar(Jogo jogo) {
    _jogos.add(jogo);
  }

  static String _validarNome(String valor) {
    final nomeTratado = valor.trim();
    if (nomeTratado.isEmpty) {
      throw ArgumentError.value(valor, 'nome', 'deve ser informado.');
    }
    return nomeTratado;
  }
}
