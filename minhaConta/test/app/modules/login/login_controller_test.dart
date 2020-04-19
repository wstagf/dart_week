import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/app_module.dart';
import 'package:minhaConta/app/modules/login/login_controller.dart';
import 'package:minhaConta/app/modules/login/login_module.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind((i) => UsuarioRepository()),
  ]);

  initModule(LoginModule(), changeBinds: [
    Bind((i) => LoginController(i.get<UsuarioRepository>())),
  ]);

  LoginController controller;

  setUp(() {
    controller = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
    test("Instanciou o controller", () {
      expect(controller, isInstanceOf<LoginController>());
    });

    test("Existe campo login", () {
      expect(controller.login, null);
    });

    test("Existe campo senha", () {
      expect(controller.senha, null);
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

    test("Ação validar login vazio", () {
      String result = controller.validateLogin("");
      equals(result != null);
    });

    test("Ação validar login com conteudo", () {
      String result = controller.validateLogin("novoValor");
      equals(result == null);
    });

    test("Ação Alterar Senha", () {
      String textoAntigo = controller.senha;
      controller.changeLogin("novoValor");
      equals(controller.login != textoAntigo);
    });

    test("Ação Armazenar novo valor na senha", () {
      controller.changeSenha("novoValor2");
      equals(controller.senha == 'novoValor2');
    });

    test("Ação validar senha vazia", () {
      String result = controller.validateSenha("");
      equals(result != null);
    });

    test("Ação validar senha com conteudo", () {
      String result = controller.validateSenha("novoValor");
      equals(result == null);
    });
  });
}
