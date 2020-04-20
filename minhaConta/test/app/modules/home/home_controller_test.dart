import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/app_module.dart';
import 'package:minhaConta/app/modules/home/home_controller.dart';
import 'package:minhaConta/app/modules/home/home_module.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';

void main() {
  initModule(HomeModule());
  HomeController home;

  setUp(() {
    home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {});

  initModule(AppModule(), changeBinds: [
    Bind((i) => UsuarioRepository()),
  ]);

  initModule(HomeModule(), changeBinds: [
    Bind((i) => HomeController(i.get<UsuarioRepository>())),
  ]);

  HomeController controller;

  setUp(() {
    controller = HomeModule.to.get<HomeController>();
  });

  group('Home Controller Test', () {
    test("Instanciou o controller", () {
      expect(controller, isInstanceOf<HomeController>());
    });

    test("Testar a função verificaLogado", () {
      // TODO Implementar o teste, antes, descobrir como faz
    });
  });
}
