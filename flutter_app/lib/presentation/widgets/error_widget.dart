import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback onRetry;

  const ErrorDisplayWidget({
    super.key,
    this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.paddingMd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: AppSpacing.paddingMd,
              decoration: BoxDecoration(
                color: AppColors.negative.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.negative,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              AppStrings.errorLoadingMarketData,
              style: AppTypography.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (errorMessage != null) ...[
              SizedBox(height: AppSpacing.sm),
              Padding(
                padding: AppSpacing.paddingHorizontalLg,
                child: Text(
                  errorMessage!,
                  textAlign: TextAlign.center,
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
            SizedBox(height: AppSpacing.xl),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 20),
              label: const Text(AppStrings.retry),
            ),
          ],
        ),
      ),
    );
  }
}
