// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login Page', () {
    final loginInputFinder = find.byValueKey('login_text_input');
    final senhaInputFinder = find.byValueKey('senha_text_input');
    final loginButtonFinder = find.byValueKey('login_button');
    final cadastreButtonFinder = find.byValueKey('cadastre_button');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Efetuar Login', () async {
      await driver.tap(loginInputFinder);
      await driver.enterText('thiago');
      await driver.waitFor(find.text('thiago')); // verify text appears on UI

      await driver.tap(senhaInputFinder);
      await driver.enterText('123456');
      await driver.waitFor(find.text('123456')); // verify text appears on UI

      // await driver.waitFor(find.text('World!'));  // verify new text appears
    });
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
  });
}
