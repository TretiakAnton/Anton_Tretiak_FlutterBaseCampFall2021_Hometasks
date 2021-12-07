import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/screens/app_screen.dart';
import 'package:campnotes/screens/details_screen.dart';
import 'package:campnotes/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title', (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());
    final titleFinder = find.text('Work');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('MyWidget find by key', (WidgetTester tester) async {
    const testKey = Key('Key');
    await tester.pumpWidget(App());

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('MyWidget find by widget type', (WidgetTester tester) async {
    Todo todo = Todo('task');
    await tester.pumpWidget(DetailsScreen(
      todo: todo,
    ));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byIcon(Icons.description), findsOneWidget);
  });
}
