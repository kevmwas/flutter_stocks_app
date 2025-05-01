import 'package:intl/intl.dart';

class Constants {
  static const String localhost = "http://192.168.100.38:4000/api";

  static const API_KEY = "6e716aea5734186ea358cbae1b0d246d";

  static const String INTRADAY_TICKERS = "http://api.marketstack.com/v1/intraday/latest?access_key=$API_KEY&symbols=AAPL,MSFT,AMZN,GOOGL,BABA,FB,VOD,V,JPM,JNJ";

  static String getStocksFor(String time) {
    return "http://api.marketstack.com/v1/intraday/$time?access_key=$API_KEY&symbols=AAPL,MSFT,AMZN,GOOGL,BABA,FB,VOD,V,JPM,JNJ";
  }

 static Map<String, String> times = {
    "today": DateTime.now().toString().substring(0,10),
    "Yesterday": DateTime.now().subtract(const Duration(days:1)).toString().substring(0,10),
    "Two days ago" : DateTime.now().subtract(const Duration(days:2)).toString().substring(0,10),
    "Three days ago" :DateTime.now().subtract(const Duration(days:3)).toString().substring(0,10),
   "Four days ago" :DateTime.now().subtract(const Duration(days:4)).toString().substring(0,10),
   "Five days ago" :DateTime.now().subtract(const Duration(days:5)).toString().substring(0,10),
   "Six days ago" :DateTime.now().subtract(const Duration(days:6)).toString().substring(0,10),
   "One Week ago" :DateTime.now().subtract(const Duration(days:7)).toString().substring(0,10)
  };
}