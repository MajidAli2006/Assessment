abstract class IMarketDataDataSource {
  Future<List<Map<String, dynamic>>> getMarketData();
}
