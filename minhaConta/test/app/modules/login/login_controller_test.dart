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
  });
}
