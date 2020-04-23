import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/models/movimentacao_model.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_module.dart';
import 'package:mobx/mobx.dart';

void main() {
  initModule(MovimentacoesModule());
  MovimentacoesController controller;

  setUp(() {
    controller = MovimentacoesModule.to.get<MovimentacoesController>();
  });

  group('MovimentacoesController Test', () {
    test("Instanciou o controller", () {
      expect(controller, isInstanceOf<MovimentacoesController>());
    });

    test("Existe campo errorMessage", () {
      expect(controller.errorMessage, equals(null));
    });

    test("Existe campo movimentacoes", () {
      // TODO Implementar o teste, antes, descobrir como faz teste de infanceOF ObservableList<MovimentacaoModel>
    });

    test("Existe campo _movimentacoesFuture", () {
      // TODO Implementar o teste, antes, descobrir como faz teste de infanceOF ObservableFuture<List<MovimentacaoModel>>
    });

    test("Validar buscarMovimentacoes", () {
      // TODO Implementar o teste, antes, descobrir como faz
    });
  });
}
