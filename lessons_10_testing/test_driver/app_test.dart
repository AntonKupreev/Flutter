import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

@Timeout(Duration(seconds: 45))
void main() {
  group('A new Flutter project', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final fieldFinderSubmit = find.text('Отправить');

    test('Test email field', () async {
      await driver.tap(fieldFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Test phone field', () async {
      await driver.tap(fieldFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('12345678');
      await driver.waitFor(find.text('12345678'));
    });

    test('Test submit', () async {
      await driver.tap(fieldFinderSubmit);
    });

    test(
      'Success text',
      () async {
        final success = find.text('Добро пожаловать');
        expect(
          await driver.getText(success),
          'Добро пожаловать',
        );
      },
      timeout: Timeout.factor(5),
    );
  });

  group('Register form tests', () {
    FlutterDriver driver;
    var fieldFinderFirstName = find.byValueKey('fisrtName');
    var fieldFinderLastName = find.byValueKey('lastName');
    var fieldFinderPhone2 = find.byValueKey('phoneField');
    var fieldFinderEmail = find.byValueKey('emailField');
    var fieldFinderSubmit2 = find.text('Отправить');

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      await driver.tap(find.byValueKey('enterButton'));
      fieldFinderFirstName = find.byValueKey('firstNameField');
      fieldFinderLastName = find.byValueKey('lastName');
      fieldFinderPhone2 = find.byValueKey('phoneField');
      fieldFinderEmail = find.byValueKey('emailField');
      fieldFinderSubmit2 = find.text('Отправить');
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
      'Test First name field',
      () async {
        await sleep(Duration(seconds: 1));
        await driver.tap(fieldFinderFirstName);
        // await driver.waitFor(find.text(''));
        await driver.enterText('Ivan');
        // await driver.waitFor(find.text('Ivan'));
      },
      timeout: Timeout.factor(2),
    );
    test(
      'Test Last name field',
      () async {
        await driver.tap(fieldFinderLastName);
        await driver.waitFor(find.text(''));
        await driver.enterText('Ivanov');
        //  await driver.waitFor(find.text('Ivanov'));
      },
      timeout: Timeout.factor(5),
    );

    test(
      'Test Phone field',
      () async {
        await driver.tap(fieldFinderPhone2);
        await driver.waitFor(find.text(''));
        await driver.enterText('12345678');
        await driver.waitFor(find.text('12345678'));
      },
      timeout: Timeout.factor(5),
    );

    test('Test email field', () async {
      await driver.tap(fieldFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Test submit', () async {
      await driver.tap(fieldFinderSubmit2);
    });

    test(
      'Success text',
      () async {
        final success = find.text('Вы успешно зарегистрировались');
        expect(
          await driver.getText(success),
          'Вы успешно зарегистрировались',
        );
      },
      timeout: Timeout.factor(5),
    );
  });
}
