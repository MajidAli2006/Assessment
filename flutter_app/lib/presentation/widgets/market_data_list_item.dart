import 'package:flutter/material.dart';
import '../../models/market_data_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import '../../utils/market_data_formatter.dart';

class MarketDataListItem extends StatelessWidget {
  final MarketData marketData;

  const MarketDataListItem({
    super.key,
    required this.marketData,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = marketData.changePercent24h >= 0;
    final changeColor = MarketDataFormatter.getChangeColor(isPositive);

    return Card(
      child: InkWell(
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
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      MarketDataFormatter.formatPrice(marketData.price),
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
            MarketDataFormatter.formatPercentage(
              marketData.changePercent24h,
              isPositive,
            ),
            style: AppTypography.changePercentageStyle(context, changeColor),
          ),
          const SizedBox(height: AppSpacing.xs / 2),
          Text(
            MarketDataFormatter.formatChange24h(marketData.change24h),
            style: AppTypography.changeAmountStyle(context, changeColor),
          ),
        ],
      ),
    );
  }
}
