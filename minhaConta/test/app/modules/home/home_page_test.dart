import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:minhaConta/app/app_module.dart';
import 'package:minhaConta/app/modules/home/home_module.dart';

void main() {
  setUp(() {
    initModules([AppModule(), HomeModule()]);
  });

  testWidgets('Existe o loading', (tester) async {
    final childWidget = Center(child: CircularProgressIndicator());

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
