import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/app_module.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_controller.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_module.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind((i) => UsuarioRepository()),
  ]);

  initModule(CadastroModule(), changeBinds: [
    Bind((i) => CadastroController(i.get<UsuarioRepository>())),
  ]);

  CadastroController controller;

  setUp(() {
    controller = CadastroModule.to.get<CadastroController>();
  });

  group('LoginController Test', () {
    test("Instanciou o controller", () {
      expect(controller, isInstanceOf<CadastroController>());
    });

    test("Existe campo login", () {
      expect(controller.login, null);
    });

    test("Existe campo senha", () {
      expect(controller.senha, null);
    });

    test("Existe campo confirmaSenha", () {
      expect(controller.confirmaSenha, null);
    });

    test("Ação Alterar login", () {
      String textoAntigo = controller.login;
      controller.changeLogin("novoValor");
      equals(controller.login != textoAntigo);
    });

    test("Ação Armazenar novo valor no login", () {
      controller.changeLogin("novoValor2");
      equals(controller.login == 'novoValor2');
    });

    test("Ação Alterar senha", () {
      String textoAntigo = controller.senha;
      controller.changeLogin("novoValor");
      equals(controller.senha != textoAntigo);
    });

    test("Ação Armazenar novo valor na senha", () {
      controller.changeLogin("novoValor2");
      equals(controller.senha == 'novoValor2');
    });
  });
}
