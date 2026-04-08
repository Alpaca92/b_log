// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:b_log/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Feed tab is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: SsukSsukApp()));

    await tester.pumpAndSettle();

    expect(find.text('우리 가족 타임라인'), findsOneWidget);
    expect(find.text('피드'), findsOneWidget);
  });
}
