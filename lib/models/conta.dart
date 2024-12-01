import 'cliente.dart';

class Conta {
  Cliente cliente;
  double saldo;

  Conta(this.cliente, [this.saldo = 0.0]);

  void depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
      print('Depósito de R\$${valor.toStringAsFixed(2)} realizado com sucesso.');
    } else {
      print('Valor de depósito inválido.');
    }
  }

  void sacar(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      print('Saque de R\$${valor.toStringAsFixed(2)} realizado com sucesso.');
    } else {
      print('Saque inválido. Verifique o saldo disponível.');
    }
  }

  void exibirSaldo() {
    print('Saldo atual: R\$${saldo.toStringAsFixed(2)}');
  }
}