import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../view_models/stocks_list_view_model.dart';
import '../widgets/all_stocks_widget.dart';
import '../widgets/app_bar.dart';
import '../widgets/check_connection.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<StocksListViewModel>(context, listen: false).allStocks();
  }

  @override
  Widget build(BuildContext context) {
    var stocksViewModel = Provider.of<StocksListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(153, 204, 255, 1.0),
        title: const AppBarWidget(),
        actions: [
          PopupMenuButton(
            onSelected: (time) {
              stocksViewModel.allStocksPerDay(Constants.times[time]!);
            },
            icon: const Icon(Icons.more_vert, color: Colors.black,),
              itemBuilder: (_) {
                return Constants.times.keys.
                map((item) => PopupMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList();
                },
          )
        ]
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const CheckConnection(),
            AllStocksWidget(stock: stocksViewModel.stocks),
            const SizedBox(height: 20,),
          ],
          ),
        ),
      )
    );
  }
}
