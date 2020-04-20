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

    test("Existe campo errorMessage", () {
      expect(controller.errorMessage, equals(null));
    });

    test("Existe campo categorias", () {
      expect(controller.categorias, equals(null));
    });

    test("Existe campo categoria", () {
      expect(controller.categoria, equals(null));
    });

    test("Existe campo categoriaValid", () {
      expect(controller.categoriaValid, equals(true));
    });

    test("Existe campo descricao", () {
      expect(controller.descricao, equals(null));
    });

    test("Existe campo valor", () {
      expect(controller.valor, equals(null));
    });

    test("Ação Alterar categroria", () {
      CategoriaModel categroria = controller.categoria;
      controller.changeCategoria(
          new CategoriaModel(id: 0, nome: 'testeCategoria', tipo: 'Despesa'));
      expect(controller.categoria, isNot(equals(categroria)));
    });

    test("Ação Alterar login", () {
      String textoAntigo = controller.descricao;
      controller.changeDescricao("changeDescricao1");
      expect(controller.descricao, isNot(equals(textoAntigo)));
    });

    test("Ação Alterar login", () {
      String textoAntigo = controller.descricao;
      controller.changeValor("changeDescricao1");
      expect(controller.descricao, isNot(equals(textoAntigo)));
    });
  });
}
