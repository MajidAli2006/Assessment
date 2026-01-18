import '../../models/market_data_model.dart';
import '../../core/interfaces/market_data_repository.dart';
import '../../core/interfaces/market_data_datasource.dart';
import '../../core/errors/failures.dart';

class MarketDataRepository implements IMarketDataRepository {
  final IMarketDataDataSource _dataSource;

  MarketDataRepository(this._dataSource);

  @override
  Future<List<MarketData>> getMarketData() async {
    try {
      final data = await _dataSource.getMarketData();
      
      if (data.isEmpty) {
        return [];
      }

      return _parseMarketData(data);
    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      throw UnknownFailure(
        'Unexpected error: ${e.toString()}',
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }

  List<MarketData> _parseMarketData(List<Map<String, dynamic>> data) {
    try {
      return data.map((json) {
        try {
          return MarketData.fromJson(json);
        } catch (e, stackTrace) {
          throw ParsingFailure(
            'Failed to parse MarketData: ${e.toString()}',
            originalError: e,
            stackTrace: stackTrace,
          );
        }
      }).toList();
    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      throw ParsingFailure(
        'Failed to parse market data list: ${e.toString()}',
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }
}
