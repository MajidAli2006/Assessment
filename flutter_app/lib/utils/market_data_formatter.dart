import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pulsenow_flutter/core/constants/app_constants.dart';
import 'package:pulsenow_flutter/core/constants/app_strings.dart';

class MarketDataFormatter {
  MarketDataFormatter._();

  static String formatPrice(double price) {
    final formatter = NumberFormat.currency(
      symbol: AppStrings.currencySymbol,
      decimalDigits: AppConstants.currencyDecimalDigits,
    );
    return formatter.format(price);
  }

  static String formatPercentage(double percentage, bool isPositive) {
    final sign = isPositive ? AppStrings.positiveSign : '';
    return '$sign${percentage.toStringAsFixed(AppConstants.percentageDecimalDigits)}${AppStrings.percentageSign}';
  }

  static String formatChange24h(double change24h) {
    final formatter = NumberFormat.currency(
      symbol: AppStrings.currencySymbol,
      decimalDigits: AppConstants.currencyDecimalDigits,
    );
    final formatted = formatter.format(change24h.abs());
    final sign = change24h >= 0 ? AppStrings.positiveSign : '-';
    return '$sign$formatted';
  }

  static Color getChangeColor(bool isPositive) {
    return isPositive
        ? const Color(AppConstants.positiveColor)
        : const Color(AppConstants.negativeColor);
  }
}
