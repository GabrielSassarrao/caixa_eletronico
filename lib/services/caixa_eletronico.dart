import 'dart:io'; // Import necessário para usar stdin
import '../models/conta.dart';

class CaixaEletronico {
  Conta conta;

  CaixaEletronico(this.conta);

  void iniciar() {
    print('Bem-vindo, ${conta.cliente.nome}!');
    int opcao;
    do {
      print('Escolha uma opção:');
      print('1 - Ver saldo');
      print('2 - Depositar');
      print('3 - Sacar');
      print('4 - Sair');

      // Leitura da opção do usuário
      opcao = int.parse(stdin.readLineSync()!);

      switch (opcao) {
        case 1:
          conta.exibirSaldo();
          break;
        case 2:
          print('Digite o valor para depósito:');
          double valor = double.parse(stdin.readLineSync()!);
          conta.depositar(valor);
          break;
        case 3:
          print('Digite o valor para saque:');
          double valor = double.parse(stdin.readLineSync()!);
          conta.sacar(valor);
          break;
        case 4:
          print('Saindo...');
          break;
        default:
          print('Opção inválida.');
      }
    } while (opcao != 4); // Fechamento correto do laço do-while
  }
}
