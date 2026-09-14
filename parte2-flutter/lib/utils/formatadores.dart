String formatarReais(double valor) =>
    'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';

String formatarData(DateTime data) =>
    '${data.day.toString().padLeft(2, '0')}/'
    '${data.month.toString().padLeft(2, '0')}/${data.year}';
