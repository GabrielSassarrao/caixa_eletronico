import 'dart:io'; // Para usar stdin
import '../models/conta.dart';

class CaixaEletronico {
  Conta conta;

  CaixaEletronico(this.conta);

  void iniciar() {
    print('Bem-vindo, ${conta.cliente.nome}!');
    int opcao;
    do {
      print('\nEscolha uma opção:');
      print('1 - Ver saldo');
      print('2 - Ver informações');
      print('3 - Depositar');
      print('4 - Sacar');
      print('5 - Investir');
      print('6 - Sair');

      opcao = int.parse(stdin.readLineSync()!);

      switch (opcao) {
        case 1:
          conta.exibirSaldo();
          break;
        case 2:
          conta.verInformacoes();
          break;
        case 3:
          print('Digite o valor para depósito:');
          double valor = double.parse(stdin.readLineSync()!);
          conta.depositar(valor);
          break;
        case 4:
          print('Digite o valor para saque:');
          double valor = double.parse(stdin.readLineSync()!);
          conta.sacar(valor);
          break;
        case 5:
          realizarInvestimento();
          break;
        case 6:
          print('Saindo...');
          break;
        default:
          print('Opção inválida.');
      }
    } while (opcao != 6);
  }

  void realizarInvestimento() {
    print('\n=== Investimento ===');
    while (true) {
      print('Digite o valor que deseja investir (Saldo atual: R\$${conta.saldo.toStringAsFixed(2)}):');
      double valorInvestimento = double.parse(stdin.readLineSync()!);

      if (valorInvestimento > 0 && valorInvestimento <= conta.saldo) {
        bool sucesso = conta.realizarInvestimento(valorInvestimento);
        if (sucesso) {
          print('Investimento concluído com sucesso!');
        } else {
          print('Investimento não teve sucesso. O valor foi perdido.');
        }
        break; // Sai do loop após uma tentativa válida
      } else {
        print('Valor inválido ou maior que o saldo disponível. Tente novamente.');
      }
    }
  }
}
