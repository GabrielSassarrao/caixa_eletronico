class Transacao {
  String tipo;
  double valor;
  DateTime data;

  Transacao(this.tipo, this.valor) : data = DateTime.now();

  @override
  String toString() {
    return '$tipo de R\$${valor.toStringAsFixed(2)} em ${data.toLocal()}';
  }
}