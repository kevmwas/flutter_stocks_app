import 'package:intl/intl.dart';

import '../models/all_stocks.dart';

class StocksViewModel {
  Stocks _stocks;

  StocksViewModel({required Stocks stock}) : _stocks = stock;

  String get symbol {
    return _stocks.symbol;
  }

  String get date {
    final dateTime = DateFormat("yyyy-mm-ddTHH:mm:ssZ").parse(_stocks.date, true);
    return DateFormat.yMMMMd('en-us').format(dateTime).toString();
  }

  double get open {
    return _stocks.open;
  }

  double get low {
    return _stocks.low;
  }

  double get high {
    return _stocks.high;
  }

  double get close {
    return _stocks.close ?? 0;
  }

  dynamic get volume {
    return _stocks.volume ?? 0;
  }
}