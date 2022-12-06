// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_10_testing/components/register_form.dart';
import 'package:lessons_10_testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("Вход", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      expect(find.byKey(Key('fieldEmail')), findsOneWidget);
      expect(find.byKey(Key('fieldPhone')), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);

      await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldPhone')), '12345678');
      expect(find.text('12345678'), findsOneWidget);

      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
      // TODO: write tests
    });
  });

  group('Register form tests', () {
    testWidgets("Регистрация", (WidgetTester tester) async {
      defaultLoginType = FormType.register;
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      await sleep(Duration(seconds: 2));
      expect(find.byKey(Key('firstNameField')), findsOneWidget);
      expect(find.byKey(Key('lastName')), findsOneWidget);
      expect(find.byKey(Key('phoneField')), findsOneWidget);
      expect(find.byKey(Key('emailField')), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);

      await tester.enterText(find.byKey(Key('firstName')), 'Ivan');
      expect(find.text('Ivan'), findsOneWidget);

      await tester.enterText(find.byKey(Key('lastName')), 'Ivanov');
      expect(find.text('Ivanov'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldPhone')), '12345678');
      expect(find.text('12345678'), findsOneWidget);

      await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);

      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
      // TODO: write tests
    });
  });
}
