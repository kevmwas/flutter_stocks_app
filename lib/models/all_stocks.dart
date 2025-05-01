class Stocks {
  final String symbol;
  final String date;
  final double open;
  final double low;
  final double high;
  final double? close;
  final dynamic volume;

  Stocks({ required this.symbol, required this.open, required this.low, required this.high, required this.close, required this.volume, required this.date});

  factory Stocks.fromJson(Map<String, dynamic> json) {
    return Stocks(
      symbol: json['symbol'],
      open: json['open'],
      low: json['low'],
      high: json['high'],
      close: json['close'],
      volume: json['volume'],
      date: json['date']
    );
  }
}
