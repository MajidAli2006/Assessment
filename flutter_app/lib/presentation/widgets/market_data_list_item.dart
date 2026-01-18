import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/market_data_model.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_typography.dart';

class MarketDataListItem extends StatelessWidget {
  final MarketData marketData;

  const MarketDataListItem({
    super.key,
    required this.marketData,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = marketData.changePercent24h >= 0;
    final changeColor = _getChangeColor(isPositive);

    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: AppSpacing.paddingMd,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      marketData.symbol,
                      style: AppTypography.symbolStyle(context).copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      _formatPrice(marketData.price),
                      style: AppTypography.priceStyle(context).copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _buildChangeIndicator(context, isPositive, changeColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChangeIndicator(
    BuildContext context,
    bool isPositive,
    Color changeColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: changeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            _formatPercentage(marketData.changePercent24h, isPositive),
            style: AppTypography.changePercentageStyle(context, changeColor),
          ),
          SizedBox(height: AppSpacing.xs / 2),
          Text(
            _formatChange24h(marketData.change24h),
            style: AppTypography.changeAmountStyle(context, changeColor),
          ),
        ],
      ),
    );
  }

  Color _getChangeColor(bool isPositive) {
    return isPositive
        ? const Color(AppConstants.positiveColor)
        : const Color(AppConstants.negativeColor);
  }

  String _formatPrice(double price) {
    final formatter = NumberFormat.currency(
      symbol: AppStrings.currencySymbol,
      decimalDigits: AppConstants.currencyDecimalDigits,
    );
    return formatter.format(price);
  }

  String _formatPercentage(double percentage, bool isPositive) {
    final sign = isPositive ? AppStrings.positiveSign : '';
    return '$sign${percentage.toStringAsFixed(AppConstants.percentageDecimalDigits)}${AppStrings.percentageSign}';
  }

  String _formatChange24h(double change24h) {
    final sign = change24h >= 0 ? AppStrings.positiveSign : '';
    return '$sign${AppStrings.currencySymbol}${change24h.toStringAsFixed(AppConstants.currencyDecimalDigits)}';
  }
}
