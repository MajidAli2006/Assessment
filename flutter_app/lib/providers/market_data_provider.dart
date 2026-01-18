import 'package:flutter/foundation.dart';
import '../models/market_data_model.dart';
import '../core/interfaces/market_data_repository.dart';
import '../data/repositories/market_data_repository.dart';
import '../data/datasources/market_data_remote_datasource.dart';
import '../core/errors/failures.dart';

class MarketDataProvider with ChangeNotifier {
  final IMarketDataRepository _repository;
  
  List<MarketData> _marketData = [];
  bool _isLoading = false;
  Failure? _failure;
  
  MarketDataProvider({
    IMarketDataRepository? repository,
  }) : _repository = repository ?? 
        MarketDataRepository(
          MarketDataRemoteDataSource(),
        );
  
  List<MarketData> get marketData => List.unmodifiable(_marketData);
  bool get isLoading => _isLoading;
  Failure? get failure => _failure;
  String? get error => _failure?.userMessage;
  bool get hasError => _failure != null;
  bool get hasData => _marketData.isNotEmpty;
  bool get isNetworkError => _failure is NetworkFailure;
  bool get isServerError => _failure is ServerFailure;
  
  Future<void> loadMarketData() async {
    if (_isLoading) return;

    _setLoading(true);
    _clearError();
    
    try {
      _marketData = await _repository.getMarketData();
    } on Failure catch (failure) {
      _setFailure(failure);
      _logError(failure);
    } catch (e, stackTrace) {
      final failure = UnknownFailure(
        'Unexpected error: ${e.toString()}',
        originalError: e,
        stackTrace: stackTrace,
      );
      _setFailure(failure);
      _logError(failure);
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }
  
  void _setLoading(bool value) {
    _isLoading = value;
  }
  
  void _setFailure(Failure? failure) {
    _failure = failure;
  }
  
  void _clearError() {
    _failure = null;
  }

  void _logError(Failure failure) {
    debugPrint('Error: ${failure.runtimeType}');
    debugPrint('Message: ${failure.message}');
    if (failure.originalError != null) {
      debugPrint('Original error: ${failure.originalError}');
    }
    if (failure.stackTrace != null) {
      debugPrint('Stack trace: ${failure.stackTrace}');
    }
  }
}
