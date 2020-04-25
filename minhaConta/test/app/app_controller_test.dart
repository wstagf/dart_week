import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:minhaConta/app/app_controller.dart';
import 'package:minhaConta/app/app_module.dart';

void main() {
  initModule(AppModule());
  AppController app;

  setUp(() {
    app = AppModule.to.get<AppController>();
  });

  group('AppController', () {
    test("Instanciado controller", () {
      expect(app, isInstanceOf<AppController>());
    });
  });
}
