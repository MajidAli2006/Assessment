import '../../models/market_data_model.dart';

abstract class IMarketDataRepository {
  Future<List<MarketData>> getMarketData();
}
