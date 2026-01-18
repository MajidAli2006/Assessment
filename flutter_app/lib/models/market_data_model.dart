class MarketData {
  final String symbol;
  final double price;
  final double change24h;
  final double changePercent24h;
  final double volume;

  const MarketData({
    required this.symbol,
    required this.price,
    required this.change24h,
    required this.changePercent24h,
    required this.volume,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) {
    try {
      return MarketData(
        symbol: _parseString(json, 'symbol'),
        price: _parseDouble(json, 'price'),
        change24h: _parseDouble(json, 'change24h'),
        changePercent24h: _parseDouble(json, 'changePercent24h'),
        volume: _parseDouble(json, 'volume'),
      );
    } catch (e) {
      throw FormatException(
        'Failed to parse MarketData from JSON: ${e.toString()}. JSON: $json',
      );
    }
  }

  static String _parseString(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value == null) {
      throw FormatException('Missing required field: $key');
    }
    if (value is! String) {
      throw FormatException('Field $key must be a String, got ${value.runtimeType}');
    }
    return value;
  }

  static double _parseDouble(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value == null) {
      throw FormatException('Missing required field: $key');
    }
    if (value is num) {
      return value.toDouble();
    }
    throw FormatException('Field $key must be a number, got ${value.runtimeType}');
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'price': price,
      'change24h': change24h,
      'changePercent24h': changePercent24h,
      'volume': volume,
    };
  }

  MarketData copyWith({
    String? symbol,
    double? price,
    double? change24h,
    double? changePercent24h,
    double? volume,
  }) {
    return MarketData(
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      change24h: change24h ?? this.change24h,
      changePercent24h: changePercent24h ?? this.changePercent24h,
      volume: volume ?? this.volume,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketData &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          price == other.price &&
          change24h == other.change24h &&
          changePercent24h == other.changePercent24h &&
          volume == other.volume;

  @override
  int get hashCode =>
      symbol.hashCode ^
      price.hashCode ^
      change24h.hashCode ^
      changePercent24h.hashCode ^
      volume.hashCode;

  @override
  String toString() {
    return 'MarketData{symbol: $symbol, price: $price, change24h: $change24h, changePercent24h: $changePercent24h, volume: $volume}';
  }
}
