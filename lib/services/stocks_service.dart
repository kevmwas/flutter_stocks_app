import 'package:dio/dio.dart';

import '../models/all_stocks.dart';
import '../utils/constants.dart';

class StockWebService {
  var dio = new Dio();

  Future<List<Stocks>> fetchAllStocksByDay(String time) async {
    final response  = await dio.get(Constants.getStocksFor(time));

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((stock) => Stocks.fromJson(stock)).toList();
    } else {
      throw Exception("Could not get the relevant stocks");
    }
  }

  Future<List<Stocks>> fetchAllStocks() async {
    final response  = await dio.get(Constants.INTRADAY_TICKERS);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((stock) => Stocks.fromJson(stock)).toList();
    } else {
      throw Exception("no data");
    }
  }
}