import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/market_data_provider.dart';
import '../presentation/widgets/market_data_list_item.dart';
import '../presentation/widgets/loading_widget.dart';
import '../presentation/widgets/error_widget.dart';
import '../presentation/widgets/empty_state_widget.dart';
import '../core/theme/app_theme.dart';

class MarketDataScreen extends StatefulWidget {
  const MarketDataScreen({super.key});

  @override
  State<MarketDataScreen> createState() => _MarketDataScreenState();
}

class _MarketDataScreenState extends State<MarketDataScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMarketData();
    });
  }

  void _loadMarketData() {
    Provider.of<MarketDataProvider>(context, listen: false).loadMarketData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketDataProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && !provider.hasData) {
          return const LoadingWidget();
        }

        if (provider.hasError && !provider.hasData) {
          return ErrorDisplayWidget(
            errorMessage: provider.error,
            onRetry: _loadMarketData,
          );
        }

        if (!provider.hasData && !provider.isLoading) {
          return EmptyStateWidget(
            onRefresh: _loadMarketData,
          );
        }

        return RefreshIndicator(
          onRefresh: () => provider.loadMarketData(),
          color: AppColors.primary,
          child: ListView.builder(
            itemCount: provider.marketData.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final marketData = provider.marketData[index];
              return MarketDataListItem(marketData: marketData);
            },
          ),
        );
      },
    );
  }
}
