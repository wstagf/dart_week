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
      expect(controller.login, equals(null));
    });

    test("Existe campo senha", () {
      expect(controller.senha, equals(null));
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
      expect(controller.senha, isNot(equals(textoAntigo)));
    });

    test("Ação Armazenar novo valor na senha", () {
      controller.changeSenha("changeSenha2");
      expect(controller.senha, equals('changeSenha2'));
    });

    test("Ação validar login vazio", () {
      String resultado = controller.validateLogin("");
      expect(resultado, isNot(equals(null)));
    });

    test("Ação validar login com conteudo", () {
      String resultado = controller.validateLogin("novoValor");
      expect(resultado, equals(null));
    });

    test("Ação validar senha vazia", () {
      String resultado = controller.validateSenha("");
      expect(resultado, isNot(equals(null)));
    });

    test("Ação validar senha com conteudo", () {
      String resultado = controller.validateSenha("novoValor");
      expect(resultado, equals(null));
    });

    test("Ação executar login com usuario e senha existente", () {
      //TODO Fazer teste com login correto
    });

    test("Ação executar login com usuario e senha errados", () {
      //TODO Fazer teste com login errado
    });

    test("Ação executar login com usuario e sem senha", () {
      //TODO Fazer teste com login errado
    });

    test("Ação executar login sem usuario e com senha", () {
      //TODO Fazer teste com login errado
    });

    test("Ação executar login sem usuario e sem senha", () {
      //TODO Fazer teste com login errado
    });
  });
}
