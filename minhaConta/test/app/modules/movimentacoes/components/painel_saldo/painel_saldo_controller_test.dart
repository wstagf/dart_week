import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_module.dart';

void main() {
  initModule(MovimentacoesModule());
  PainelSaldoController painelsaldo;

  setUp(() {
    painelsaldo = MovimentacoesModule.to.get<PainelSaldoController>();
  });

  group('PainelSaldoController Test', () {});
}
