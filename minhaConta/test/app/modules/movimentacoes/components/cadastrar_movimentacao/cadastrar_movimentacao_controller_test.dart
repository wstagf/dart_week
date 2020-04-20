import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/models/categoria_model.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/cadastrar_movimentacao/cadastrar_movimentacao_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_module.dart';

void main() {
  initModule(MovimentacoesModule());
  CadastrarMovimentacaoController controller;

  setUp(() {
    controller = MovimentacoesModule.to.get<CadastrarMovimentacaoController>();
  });

  group('CadastrarMovimentacaoController Test', () {
    test("Instanciou o controller", () {
      expect(controller, isInstanceOf<CadastrarMovimentacaoController>());
    });

    test("Existe campo dataInclusao", () {
      expect(controller.dataInclusao, isInstanceOf<DateTime>());
    });
  });
}
