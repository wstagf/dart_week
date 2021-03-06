// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:ozzie/ozzie.dart';
import 'package:test/test.dart';

void main() {
  final loginInputFinder = find.byValueKey('login_text_input');
  final senhaInputFinder = find.byValueKey('senha_text_input');
  final loginButtonFinder = find.byValueKey('login_button');
  final cadastreButtonFinder = find.byValueKey('cadastre_button');

  FlutterDriver driver;
  Ozzie ozzie;

  Future<void> delay([int milliseconds = 250]) async {
    await Future<void>.delayed(Duration(milliseconds: milliseconds));
  }

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
    ozzie = Ozzie.initWith(driver, groupName: 'flutter');
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) driver.close();
    ozzie.generateHtmlReport();
  });

  test('Efetuar login Correto', () async {
    await ozzie.profilePerformance('efetuar_login_correto', () async {
      await driver.tap(loginInputFinder);
      await driver.enterText('thiago');
      await ozzie.takeScreenshot('efetuar_login');
      await driver.tap(senhaInputFinder);
      await driver.enterText('123456');
      await ozzie.takeScreenshot('efetuar_login');
      await driver.tap(loginButtonFinder);
      final cadastreButtonFinder = find.byValueKey('movimentacoes_title');
      await driver.waitFor(cadastreButtonFinder,
          timeout: Duration(seconds: 10));
      await ozzie.takeScreenshot('efetuar_login');
    });
  });

  // test('Preencher senha', () async {
  //   await driver.tap(senhaInputFinder);
  //   await driver.enterText('123456');
  //   await driver.waitFor(find.text('123456'));
  // });

  // test('Clicar no botao Login', () async {
  //   await driver.tap(loginButtonFinder);
  //   final cadastreButtonFinder = find.byValueKey('movimentacoes_title');
  //   await driver.waitFor(cadastreButtonFinder, timeout: Duration(seconds: 5));
  // });

  // test('Text H', () async {
  //   // Use the `driver.getText` method to verify the counter starts at 0.
  //   expect(await driver.getText(counterTextFinder), "0");
  // });

  // test('increments the counter', () async {
  //   // First, tap the button.
  //   await driver.tap(buttonFinder);

  //   // Then, verify the counter text is incremented by 1.
  //   expect(await driver.getText(counterTextFinder), "1");
  // });
}
