import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sunflower/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Drawer opens and contains items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Drawer), findsNothing);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.byType(Drawer), findsOneWidget);

    expect(find.text('Foo.bar()'), findsOneWidget);
    expect(find.text('baz()'), findsOneWidget);
    expect(find.text('main()'), findsOneWidget);
  });
}
