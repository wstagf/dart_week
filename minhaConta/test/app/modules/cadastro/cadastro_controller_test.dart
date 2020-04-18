import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_controller.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_module.dart';

void main() {
  initModule(CadastroModule());
  CadastroController cadastro;

  setUp(() {
    cadastro = CadastroModule.to.get<CadastroController>();
  });

  group('CadastroController Test', () {
    test("First Test", () {
      expect(cadastro, isInstanceOf<CadastroController>());
    });
  });
}
