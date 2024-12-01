import 'models/cliente.dart';
import 'models/conta.dart';
import 'services/caixa_eletronico.dart';

void main() {
  var cliente = Cliente('João Silva', '123.456.789-00');
  var conta = Conta(cliente, 100.0);
  var caixaEletronico = CaixaEletronico(conta);

  caixaEletronico.iniciar();
}