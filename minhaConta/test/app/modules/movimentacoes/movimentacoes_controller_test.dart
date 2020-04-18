import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_module.dart';

void main() {
  initModule(MovimentacoesModule());
  MovimentacoesController movimentacoes;

  setUp(() {
    movimentacoes = MovimentacoesModule.to.get<MovimentacoesController>();
  });

  group('MovimentacoesController Test', () {
    test("First Test", () {
      expect(movimentacoes, isInstanceOf<MovimentacoesController>());
    });
  });
}
