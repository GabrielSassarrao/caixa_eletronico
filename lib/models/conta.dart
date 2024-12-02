import 'dart:math'; // Para usar Random
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

  void verInformacoes() {
    print('Cliente: ${cliente.nome}');
    print('CPF: ${cliente.cpf}');
    print('Saldo: R\$${saldo.toStringAsFixed(2)}');
  }

  bool realizarInvestimento(double valorInvestido) {
    if (valorInvestido > saldo) {
      print('Valor do investimento maior que o saldo disponível.');
      return false;
    }

    // Debitar valor investido
    saldo -= valorInvestido;
    print('R\$${valorInvestido.toStringAsFixed(2)} foi debitado para investimento.');

    // Gerar resultado do investimento
    int resultado = Random().nextInt(2); // Gera 0 ou 1
    if (resultado == 0) {
      // Sucesso no investimento
      double retorno = valorInvestido * 0.5; // 50% de lucro
      saldo += valorInvestido + retorno;
      print('Investimento bem-sucedido! Você ganhou 50% do valor investido.');
      return true;
    } else {
      // Fracasso no investimento
      print('Investimento falhou. Você perdeu o valor investido.');
      return false;
    }
  }
}
