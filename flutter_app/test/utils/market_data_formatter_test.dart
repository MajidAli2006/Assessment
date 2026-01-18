import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulsenow_flutter/utils/market_data_formatter.dart';

void main() {
  group('MarketDataFormatter', () {
    group('formatPrice', () {
      test('formats price with currency symbol', () {
        expect(MarketDataFormatter.formatPrice(43250.50), '\$43,250.50');
      });

      test('formats small price correctly', () {
        expect(MarketDataFormatter.formatPrice(0.01), '\$0.01');
      });

      test('formats large price correctly', () {
        expect(MarketDataFormatter.formatPrice(1000000.99), '\$1,000,000.99');
      });

      test('formats zero correctly', () {
        expect(MarketDataFormatter.formatPrice(0), '\$0.00');
      });

      test('formats negative price correctly', () {
        expect(MarketDataFormatter.formatPrice(-100.50), '-\$100.50');
      });
    });

    group('formatPercentage', () {
      test('formats positive percentage with sign', () {
        expect(MarketDataFormatter.formatPercentage(2.5, true), '+2.50%');
      });

      test('formats negative percentage without sign', () {
        expect(MarketDataFormatter.formatPercentage(-3.75, false), '-3.75%');
      });

      test('formats zero percentage', () {
        expect(MarketDataFormatter.formatPercentage(0, true), '+0.00%');
        expect(MarketDataFormatter.formatPercentage(0, false), '0.00%');
      });

      test('formats large percentage correctly', () {
        expect(MarketDataFormatter.formatPercentage(99.99, true), '+99.99%');
      });
    });

    group('formatChange24h', () {
      test('formats positive change with sign', () {
        expect(MarketDataFormatter.formatChange24h(1250.30), '+\$1,250.30');
      });

      test('formats negative change without explicit sign', () {
        expect(MarketDataFormatter.formatChange24h(-500.25), '-\$500.25');
      });

      test('formats zero change', () {
        expect(MarketDataFormatter.formatChange24h(0), '+\$0.00');
      });

      test('formats small change correctly', () {
        expect(MarketDataFormatter.formatChange24h(0.01), '+\$0.01');
      });
    });

    group('getChangeColor', () {
      test('returns green color for positive change', () {
        final color = MarketDataFormatter.getChangeColor(true);
        expect(color, const Color(0xFF4CAF50));
      });

      test('returns red color for negative change', () {
        final color = MarketDataFormatter.getChangeColor(false);
        expect(color, const Color(0xFFF44336));
      });
    });
  });
}
