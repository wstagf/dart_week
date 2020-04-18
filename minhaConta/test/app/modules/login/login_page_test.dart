import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:minhaConta/app/app_module.dart';
import 'package:minhaConta/app/modules/home/home_module.dart';
import 'package:minhaConta/app/modules/login/login_controller.dart';
import 'package:minhaConta/app/modules/login/login_module.dart';

import 'package:minhaConta/app/modules/login/login_page.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';

main() {
  testWidgets('Has Input Login', (WidgetTester tester) async {
    //await tester.pumpWidget(buildTestableWidget(LoginPage(title: 'Login')));
    // final titleFinder =
    //expect(find.text('H'), findsOneWidget);

    // await tester.pumpWidget(MaterialApp(
    //   home: Scaffold(
    //     body: Text('H'),
    //   ),
    // ));

    // // Find a widget that displays the letter 'H'.
    // expect(find.text('H'), findsOneWidget);
  });
}
