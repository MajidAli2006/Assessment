import 'package:flutter_test/flutter_test.dart';
import 'package:pulsenow_flutter/models/market_data_model.dart';

void main() {
  group('MarketData', () {
    const testMarketData = MarketData(
      symbol: 'BTC/USD',
      price: 43250.50,
      change24h: 1250.30,
      changePercent24h: 2.96,
      volume: 5000000000.0,
    );

    test('creates instance with all required fields', () {
      expect(testMarketData.symbol, 'BTC/USD');
      expect(testMarketData.price, 43250.50);
      expect(testMarketData.change24h, 1250.30);
      expect(testMarketData.changePercent24h, 2.96);
      expect(testMarketData.volume, 5000000000.0);
    });

    test('creates instance from valid JSON', () {
      final json = {
        'symbol': 'ETH/USD',
        'price': 2500.75,
        'change24h': -100.25,
        'changePercent24h': -3.85,
        'volume': 2000000000.0,
      };

      final marketData = MarketData.fromJson(json);

      expect(marketData.symbol, 'ETH/USD');
      expect(marketData.price, 2500.75);
      expect(marketData.change24h, -100.25);
      expect(marketData.changePercent24h, -3.85);
      expect(marketData.volume, 2000000000.0);
    });

    test('creates instance from JSON with integer numbers', () {
      final json = {
        'symbol': 'SOL/USD',
        'price': 100,
        'change24h': 5,
        'changePercent24h': 5,
        'volume': 1000000,
      };

      final marketData = MarketData.fromJson(json);

      expect(marketData.price, 100.0);
      expect(marketData.change24h, 5.0);
      expect(marketData.changePercent24h, 5.0);
      expect(marketData.volume, 1000000.0);
    });

    test('throws FormatException when symbol is missing', () {
      final json = {
        'price': 43250.50,
        'change24h': 1250.30,
        'changePercent24h': 2.96,
        'volume': 5000000000.0,
      };

      expect(
        () => MarketData.fromJson(json),
        throwsA(isA<FormatException>().having(
          (e) => e.message,
          'message',
          contains('Missing required field: symbol'),
        )),
      );
    });

    test('throws FormatException when price is missing', () {
      final json = {
        'symbol': 'BTC/USD',
        'change24h': 1250.30,
        'changePercent24h': 2.96,
        'volume': 5000000000.0,
      };

      expect(
        () => MarketData.fromJson(json),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException when symbol is not a String', () {
      final json = {
        'symbol': 123,
        'price': 43250.50,
        'change24h': 1250.30,
        'changePercent24h': 2.96,
        'volume': 5000000000.0,
      };

      expect(
        () => MarketData.fromJson(json),
        throwsA(isA<FormatException>().having(
          (e) => e.message,
          'message',
          contains('Field symbol must be a String'),
        )),
      );
    });

    test('throws FormatException when price is not a number', () {
      final json = {
        'symbol': 'BTC/USD',
        'price': 'invalid',
        'change24h': 1250.30,
        'changePercent24h': 2.96,
        'volume': 5000000000.0,
      };

      expect(
        () => MarketData.fromJson(json),
        throwsA(isA<FormatException>().having(
          (e) => e.message,
          'message',
          contains('Field price must be a number'),
        )),
      );
    });

    test('converts to JSON correctly', () {
      final json = testMarketData.toJson();

      expect(json['symbol'], 'BTC/USD');
      expect(json['price'], 43250.50);
      expect(json['change24h'], 1250.30);
      expect(json['changePercent24h'], 2.96);
      expect(json['volume'], 5000000000.0);
    });

    test('copyWith creates new instance with updated values', () {
      final updated = testMarketData.copyWith(
        price: 45000.0,
        changePercent24h: 5.0,
      );

      expect(updated.symbol, 'BTC/USD');
      expect(updated.price, 45000.0);
      expect(updated.change24h, 1250.30);
      expect(updated.changePercent24h, 5.0);
      expect(updated.volume, 5000000000.0);
    });

    test('copyWith keeps original values when not provided', () {
      final copied = testMarketData.copyWith();

      expect(copied.symbol, testMarketData.symbol);
      expect(copied.price, testMarketData.price);
      expect(copied.change24h, testMarketData.change24h);
      expect(copied.changePercent24h, testMarketData.changePercent24h);
      expect(copied.volume, testMarketData.volume);
    });

    test('equality operator returns true for identical instances', () {
      const marketData1 = MarketData(
        symbol: 'BTC/USD',
        price: 43250.50,
        change24h: 1250.30,
        changePercent24h: 2.96,
        volume: 5000000000.0,
      );

      const marketData2 = MarketData(
        symbol: 'BTC/USD',
        price: 43250.50,
        change24h: 1250.30,
        changePercent24h: 2.96,
        volume: 5000000000.0,
      );

      expect(marketData1 == marketData2, isTrue);
    });

    test('equality operator returns false for different instances', () {
      const marketData1 = MarketData(
        symbol: 'BTC/USD',
        price: 43250.50,
        change24h: 1250.30,
        changePercent24h: 2.96,
        volume: 5000000000.0,
      );

      const marketData2 = MarketData(
        symbol: 'ETH/USD',
        price: 43250.50,
        change24h: 1250.30,
        changePercent24h: 2.96,
        volume: 5000000000.0,
      );

      expect(marketData1 == marketData2, isFalse);
    });

    test('hashCode is same for equal instances', () {
      const marketData1 = MarketData(
        symbol: 'BTC/USD',
        price: 43250.50,
        change24h: 1250.30,
        changePercent24h: 2.96,
        volume: 5000000000.0,
      );

      const marketData2 = MarketData(
        symbol: 'BTC/USD',
        price: 43250.50,
        change24h: 1250.30,
        changePercent24h: 2.96,
        volume: 5000000000.0,
      );

      expect(marketData1.hashCode, marketData2.hashCode);
    });

    test('toString returns formatted string', () {
      final str = testMarketData.toString();
      expect(str, contains('BTC/USD'));
      expect(str, contains('43250.5'));
      expect(str, contains('1250.3'));
      expect(str, contains('2.96'));
    });
  });
}
