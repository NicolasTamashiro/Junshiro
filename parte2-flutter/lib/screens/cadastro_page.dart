import 'package:flutter/material.dart';

import '../models/jogo.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final anoController = TextEditingController();
  final precoController = TextEditingController();

  @override
  void dispose() {
    tituloController.dispose();
    anoController.dispose();
    precoController.dispose();
    super.dispose();
  }

  void salvar() {
    if (!formKey.currentState!.validate()) return;

    Navigator.of(context).pop(
      Jogo(
        titulo: tituloController.text,
        anoLancamento: int.parse(anoController.text),
        precoPago: double.parse(precoController.text.replaceAll(',', '.')),
        dataAquisicao: DateTime.now(),
      ),
    );
  }

  InputDecoration campo(String texto, IconData icone) {
    return InputDecoration(
      labelText: texto,
      prefixIcon: Icon(icone),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar jogo')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: tituloController,
              decoration: campo('Título', Icons.title),
              validator: validarTitulo,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: anoController,
              decoration: campo('Ano de lançamento', Icons.calendar_today),
              keyboardType: TextInputType.number,
              validator: validarAno,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: precoController,
              decoration: campo('Preço pago', Icons.attach_money),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: validarPreco,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: salvar, child: const Text('Confirmar')),
          ],
        ),
      ),
    );
  }
}

String? validarTitulo(String? texto) =>
    texto == null || texto.trim().isEmpty ? 'Informe um título.' : null;

String? validarAno(String? texto) {
  final ano = int.tryParse(texto ?? '');
  return ano == null || ano <= 0 ? 'Informe um ano válido.' : null;
}

String? validarPreco(String? texto) {
  final preco = double.tryParse((texto ?? '').replaceAll(',', '.'));
  return preco == null || preco < 0 ? 'Informe um preço válido.' : null;
}
