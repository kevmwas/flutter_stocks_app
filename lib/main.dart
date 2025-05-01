import 'package:flutter/material.dart';
import 'package:flutter_stocks_app/screens/landingPage.dart';
import 'package:flutter_stocks_app/view_models/stocks_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => StocksListViewModel(),
      )
    ], child: const LandingPage(),
  ),
));