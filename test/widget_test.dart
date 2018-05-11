// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('ADD test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1+2'), findsNothing);
    expect(find.text('3.0'), findsNothing);
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('+'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1+2'), findsOneWidget);
    expect(find.text('3.0'), findsOneWidget);
    await tester.tap(find.text('='));
    await tester.pump();
    expect(find.text('1+2'), findsNothing);
    expect(find.text('3.0'), findsNWidgets(2));
  });
  testWidgets('SUB test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1-2'), findsNothing);
    expect(find.text('-1.0'), findsNothing);
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('-'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1-2'), findsOneWidget);
    expect(find.text('-1.0'), findsOneWidget);
    await tester.tap(find.text('='));
    await tester.pump();
    expect(find.text('1-2'), findsNothing);
    expect(find.text('-1.0'), findsNWidgets(2));
  });
  testWidgets('MUL test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1*2'), findsNothing);
    expect(find.text('2.0'), findsNothing);
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('*'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1*2'), findsOneWidget);
    expect(find.text('2.0'), findsOneWidget);
    await tester.tap(find.text('='));
    await tester.pump();
    expect(find.text('1*2'), findsNothing);
    expect(find.text('2.0'), findsNWidgets(2));
  });
  testWidgets('DIV test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1/2'), findsNothing);
    expect(find.text('0.5'), findsNothing);
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('/'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1/2'), findsOneWidget);
    expect(find.text('0.5'), findsOneWidget);
    await tester.tap(find.text('='));
    await tester.pump();
    expect(find.text('1/2'), findsNothing);
    expect(find.text('0.5'), findsNWidgets(2));
  });
  testWidgets('FLOAT test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('0.5'), findsNothing);
    await tester.tap(find.text('.'));
    await tester.pump();
    await tester.tap(find.text('5'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('0.5'), findsNWidgets(2));
  });
  testWidgets('CE test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('123'), findsNothing);
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('3'));
    await tester.pump();
    expect(find.text('123'), findsOneWidget);
    expect(find.text('123.0'), findsOneWidget);
    await tester.tap(find.text('CE'));
    await tester.pump();
    expect(find.text('12'), findsOneWidget);
    expect(find.text('12.0'), findsOneWidget);
    await tester.tap(find.text('3'));
    await tester.pump();
    await tester.tap(find.text('4'));
    await tester.pump();
    expect(find.text('1234'), findsOneWidget);
    expect(find.text('1234.0'), findsOneWidget);
    await tester.longPress(find.text('CE'));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('0.0'), findsOneWidget);
    expect(find.text('1234'), findsNothing);
    expect(find.text('1234.0'), findsNothing);
  });
}
