class AppConstants {
  AppConstants._();

  // Use 10.0.2.2 for Android emulator, localhost for iOS simulator
  static const String baseUrl = 'http://localhost:3000/api';
  static const String wsUrl = 'ws://localhost:3000';
  
  // For Android emulator, use:
  // static const String baseUrl = 'http://10.0.2.2:3000/api';
  // static const String wsUrl = 'ws://10.0.2.2:3000';
  
  static const String marketDataEndpoint = '/market-data';
  static const String analyticsEndpoint = '/analytics';
  static const String portfolioEndpoint = '/portfolio';
  
  static const int httpOk = 200;
  static const int httpNotFound = 404;
  static const int httpServerError = 500;
  
  static const List<String> timeframes = ['1h', '4h', '1d', '7d', '30d'];
  
  static const int positiveColor = 0xFF4CAF50;
  static const int negativeColor = 0xFFF44336;
  
  static const double defaultPadding = 16.0;
  static const double cardElevation = 1.0;
  static const double cardMargin = 4.0;
  static const double iconSize = 64.0;
  static const int currencyDecimalDigits = 2;
  static const int percentageDecimalDigits = 2;
}
