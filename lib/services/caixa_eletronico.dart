import 'dart:io'; // Import necessário para usar stdin
import '../models/conta.dart'; // Importa a classe Conta corretamente

class CaixaEletronico {
  Conta conta;

  CaixaEletronico(this.conta);

  // Novo método para exibir informações do cliente e saldo
  void verInformacoes() {
    print('Informações do cliente:');
    print('Nome: ${conta.cliente.nome}');
    print('CPF: ${conta.cliente.cpf}');
    conta.exibirSaldo();
  }

  void iniciar() {
    print('Bem-vindo, ${conta.cliente.nome}!');
    int opcao;
    do {
      print('Escolha uma opção:');
      print('1 - Ver saldo');
      print('2 - Depositar');
      print('3 - Sacar');
      print('4 - Ver informações');
      print('5 - Sair');

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
          verInformacoes(); // Chama o método de exibição das informações
          break;
        case 5:
          print('Saindo...');
          break;
        default:
          print('Opção inválida.');
      }
    } while (opcao != 5); // Atualiza para 5 para permitir a opção de sair
  }
}
