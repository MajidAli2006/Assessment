import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/app_constants.dart';

@Deprecated('Use MarketDataRepository instead')
class ApiService {
  static const String baseUrl = AppConstants.baseUrl;
  
  @Deprecated('Use MarketDataRepository.getMarketData() instead')
  Future<List<Map<String, dynamic>>> getMarketData() async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.marketDataEndpoint}');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        
        if (jsonData['success'] == true && jsonData['data'] != null) {
          final dataList = jsonData['data'] as List;
          return dataList.map((item) => item as Map<String, dynamic>).toList();
        } else {
          throw Exception('Invalid response format from API');
        }
      } else {
        throw Exception('Failed to load market data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load market data: ${e.toString()}');
    }
  }
}
