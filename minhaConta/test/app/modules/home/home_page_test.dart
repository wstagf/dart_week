import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:minhaConta/app/app_controller.dart';
import 'package:minhaConta/app/app_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/home/home_module.dart';
import 'package:minhaConta/app/modules/home/home_page.dart';
import 'package:minhaConta/app/repositories/interfaces/usuario_repository_interface.dart';
import 'package:minhaConta/app/repositories/mocks/usuario_repository_mock.dart';

void main() {
  initModule(AppModule());
  initModule(HomeModule(), changeBinds: [
    Bind<IUsuarioRepository>((i) => UsuarioRepositoryMock()),
  ]);
  AppController app;

  setUp(() {
    app = AppModule.to.get<AppController>();
  });

  testWidgets('Existe o loagind', (tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));

    final loadingFinder = find.byKey(Key('loading'));

    expect(loadingFinder, findsOneWidget);
  });
}
