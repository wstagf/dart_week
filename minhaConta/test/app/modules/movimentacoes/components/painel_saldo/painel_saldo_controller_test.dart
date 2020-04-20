import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_module.dart';

void main() {
  initModule(MovimentacoesModule());
  PainelSaldoController controller;

  setUp(() {
    controller = MovimentacoesModule.to.get<PainelSaldoController>();
  });

  group('PainelSaldoController Test', () {
    test("Instanciou o controller", () {
      expect(controller, isInstanceOf<PainelSaldoController>());
    });

    test("Existe campo dataInclusao", () {
      expect(controller.data, isInstanceOf<DateTime>());
    });

    test("Existe campo anoMes", () {
      expect(controller.anoMes, isInstanceOf<String>());
    });

    test("Ação buscarTotalDoMes", () {
      //TODO Fazer este teste
    });
  });
}
