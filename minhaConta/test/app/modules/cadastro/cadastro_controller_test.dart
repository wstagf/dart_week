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
      expect(controller.login, equals(null));
    });

    test("Existe campo senha", () {
      expect(controller.senha, equals(null));
    });

    test("Existe campo confirmaSenha", () {
      expect(controller.confirmaSenha, equals(null));
    });

    test("Ação Alterar login", () {
      String textoAntigo = controller.login;
      controller.changeLogin("changeLogin");
      expect(controller.login, isNot(equals(textoAntigo)));
    });

    test("Ação Armazenar novo valor no login", () {
      controller.changeLogin("changeLogin2");
      expect(controller.login, equals('changeLogin2'));
    });

    test("Ação Alterar senha", () {
      String textoAntigo = controller.senha;
      controller.changeSenha("changeSenha");
      equals(controller.senha != textoAntigo);
    });

    test("Ação Armazenar novo valor na senha", () {
      controller.changeSenha("changeSenha2");
      expect(controller.senha, equals('changeSenha2'));
    });

    test("Ação Alterar confirmaSenha", () {
      String textoAntigo = controller.confirmaSenha;
      controller.changeConfirmaSenha("changeConfirmaSenha");
      equals(controller.confirmaSenha != textoAntigo);
    });

    test("Ação Armazenar novo valor no confirmaSenha", () {
      controller.changeConfirmaSenha("changeConfirmaSenha2");
      expect(controller.confirmaSenha, equals('changeConfirmaSenha2'));
    });
  });
}
