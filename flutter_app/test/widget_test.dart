import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:pulsenow_flutter/main.dart';
import 'package:pulsenow_flutter/providers/market_data_provider.dart';

void main() {
  testWidgets('PulseNow app launches and shows HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const PulseNowApp());

    expect(find.text('PulseNow'), findsOneWidget);
  });

  testWidgets('app provides MarketDataProvider', (WidgetTester tester) async {
    await tester.pumpWidget(const PulseNowApp());

    final context = tester.element(find.byType(MaterialApp));
    final provider = Provider.of<MarketDataProvider>(context, listen: false);
    expect(provider, isA<MarketDataProvider>());
  });

  testWidgets('MaterialApp has correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const PulseNowApp());

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.title, 'PulseNow');
  });
}
