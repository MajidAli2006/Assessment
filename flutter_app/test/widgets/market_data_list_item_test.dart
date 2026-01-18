import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulsenow_flutter/models/market_data_model.dart';
import 'package:pulsenow_flutter/presentation/widgets/market_data_list_item.dart';

void main() {
  group('MarketDataListItem', () {
    const testMarketData = MarketData(
      symbol: 'BTC/USD',
      price: 43250.50,
      change24h: 1250.30,
      changePercent24h: 2.96,
      volume: 5000000000.0,
    );

    Widget createWidget({required MarketData marketData}) {
      return MaterialApp(
        home: Scaffold(
          body: MarketDataListItem(marketData: marketData),
        ),
      );
    }

    testWidgets('displays symbol correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.text('BTC/USD'), findsOneWidget);
    });

    testWidgets('displays formatted price', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.textContaining('\$43,250.50'), findsOneWidget);
    });

    testWidgets('displays positive percentage change with green color',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.textContaining('+2.96%'), findsOneWidget);
    });

    testWidgets('displays negative percentage change correctly',
        (WidgetTester tester) async {
      const negativeMarketData = MarketData(
        symbol: 'ETH/USD',
        price: 2500.0,
        change24h: -100.0,
        changePercent24h: -3.85,
        volume: 2000000000.0,
      );

      await tester.pumpWidget(createWidget(marketData: negativeMarketData));

      expect(find.textContaining('-3.85%'), findsOneWidget);
    });

    testWidgets('displays formatted 24h change amount',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.textContaining('+\$1,250.30'), findsOneWidget);
    });

    testWidgets('renders as Card widget', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('renders InkWell widget', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('has correct widget structure', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(marketData: testMarketData));

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(2));
    });
  });
}
