import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulsenow_flutter/presentation/widgets/loading_widget.dart';

void main() {
  group('LoadingWidget', () {
    Widget createWidget() {
      return const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      );
    }

    testWidgets('displays CircularProgressIndicator', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('is centered on screen', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('has correct widget hierarchy', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());

      final center = tester.widget<Center>(find.byType(Center));
      expect(center.child, isA<CircularProgressIndicator>());
    });
  });
}
