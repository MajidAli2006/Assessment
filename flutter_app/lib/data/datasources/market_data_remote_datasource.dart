import 'dart:async';
import 'dart:convert';
import 'dart:io' show SocketException, HttpException;
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';
import '../../core/interfaces/market_data_datasource.dart';
import '../../core/errors/failures.dart';

class MarketDataRemoteDataSource implements IMarketDataDataSource {
  final http.Client _client;
  final String _baseUrl;
  final Duration _timeout;

  MarketDataRemoteDataSource({
    http.Client? client,
    String? baseUrl,
    Duration? timeout,
  })  : _client = client ?? http.Client(),
        _baseUrl = baseUrl ?? AppConstants.baseUrl,
        _timeout = timeout ?? const Duration(seconds: 30);

  @override
  Future<List<Map<String, dynamic>>> getMarketData() async {
    try {
      final uri = Uri.parse('$_baseUrl${AppConstants.marketDataEndpoint}');
      
      final response = await _client
          .get(uri)
          .timeout(
            _timeout,
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${_timeout.inSeconds} seconds',
                _timeout,
              );
            },
          );

      if (response.statusCode == AppConstants.httpOk) {
        return _parseResponse(response.body);
      }

      return _handleHttpError(response.statusCode, response.body);
    } on TimeoutException catch (e, stackTrace) {
      throw NetworkFailure(
        'Request timeout: ${e.message}',
        originalError: e,
        stackTrace: stackTrace,
      );
    } on SocketException catch (e, stackTrace) {
      throw NetworkFailure(
        'Network error: ${e.message}',
        originalError: e,
        stackTrace: stackTrace,
      );
    } on HttpException catch (e, stackTrace) {
      throw NetworkFailure(
        'HTTP error: ${e.message}',
        originalError: e,
        stackTrace: stackTrace,
      );
    } on Failure {
      rethrow;
    } on FormatException catch (e, stackTrace) {
      throw ParsingFailure(
        'Invalid response format: ${e.message}',
        originalError: e,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      throw NetworkFailure(
        'Unexpected network error: ${e.toString()}',
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }

  List<Map<String, dynamic>> _handleHttpError(int statusCode, String body) {
    if (statusCode >= 500) {
      throw ServerFailure(
        'Server error: HTTP $statusCode',
        statusCode: statusCode,
      );
    } else if (statusCode == 404) {
      throw ServerFailure(
        'Endpoint not found',
        statusCode: statusCode,
      );
    } else if (statusCode == 401) {
      throw ServerFailure(
        'Unauthorized access',
        statusCode: statusCode,
      );
    } else if (statusCode == 403) {
      throw ServerFailure(
        'Access forbidden',
        statusCode: statusCode,
      );
    } else if (statusCode >= 400) {
      throw ServerFailure(
        'Client error: HTTP $statusCode',
        statusCode: statusCode,
      );
    } else {
      throw ServerFailure(
        'HTTP error: $statusCode',
        statusCode: statusCode,
      );
    }
  }

  List<Map<String, dynamic>> _parseResponse(String responseBody) {
    if (responseBody.isEmpty) {
      throw InvalidDataFailure('Empty response received');
    }

    try {
      final dynamic jsonData = json.decode(responseBody);

      if (jsonData is! Map<String, dynamic>) {
        throw InvalidDataFailure('Response is not a JSON object');
      }

      if (jsonData['success'] != true) {
        final errorObj = jsonData['error'];
        final errorMessage = (errorObj is Map<String, dynamic> && errorObj['message'] is String)
            ? errorObj['message'] as String
            : 'Invalid response';
        throw InvalidDataFailure(errorMessage);
      }

      if (jsonData['data'] == null) {
        throw InvalidDataFailure('Response missing data field');
      }

      if (jsonData['data'] is! List) {
        throw InvalidDataFailure('Data field is not a list');
      }

      final dataList = jsonData['data'] as List;
      return dataList.map((item) {
        if (item is! Map<String, dynamic>) {
          throw InvalidDataFailure('Invalid item format in data list');
        }
        return item;
      }).toList();
    } on Failure {
      rethrow;
    } on FormatException catch (e, stackTrace) {
      throw ParsingFailure(
        'JSON parsing error: ${e.message}',
        originalError: e,
        stackTrace: stackTrace,
      );
    } on TypeError catch (e, stackTrace) {
      throw ParsingFailure(
        'Type error during parsing: ${e.toString()}',
        originalError: e,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      throw InvalidDataFailure(
        'Failed to parse response: ${e.toString()}',
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }
}
