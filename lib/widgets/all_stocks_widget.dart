import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/single_stocks_screen.dart';
import '../view_models/stock_view_model.dart';
import '../view_models/stocks_list_view_model.dart';

class AllStocksWidget extends  StatefulWidget {
  final List<StocksViewModel> stock;
  const AllStocksWidget({super.key, required this.stock});

  @override
  State<AllStocksWidget> createState() => _AllStocksWidgetState(stock: stock);
}

class _AllStocksWidgetState extends State<AllStocksWidget> {
List stock;
 _AllStocksWidgetState({required this.stock});

  void _showSingleStockDetails(context, stock) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SingleStockDetailScreen( stock: stock);
    }
    )
    );
  }
  var listSearch;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var listViewModel = Provider.of<StocksListViewModel>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                listSearch = listViewModel.stocks
                    .where((element) =>
                    element.symbol.contains(value.toUpperCase()))
                    .toList();
              });
            },
            controller: _textEditingController,
            focusNode: _textFocusNode,
            decoration: const InputDecoration(
                labelText: "Search Tickers",
                hintText: "Search Tickers",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          ),
        ),
        _textEditingController!.text.isNotEmpty &&
            listSearch!.length == 0
            ? const Text('No Ticker Found') :
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _textEditingController!.text.isNotEmpty
              ? listSearch!.length
              : listViewModel.stocks.length,
          itemBuilder: (BuildContext context, int index) {
            var sym = _textEditingController!.text.isNotEmpty
                ? listSearch![index].symbol
                : listViewModel.stocks[index].symbol;
            String name;
            String image;
            if(sym == "AAPL"){
              name = "Apple";
              image = "assets/apple.jpg";
            } else if (sym == "MSFT"){
              name = "Microsoft";
              image = "assets/microsoft.png";
            } else if (sym == "AMZN") {
              name = "Amazon";
              image = "assets/amazon.png";
            } else if (sym == "GOOGL") {
              name = "Alphabet Inc";
              image = "assets/alphabet.jpg";
            } else if (sym == "FB") {
              name = "Meta Platforms Inc";
              image = "assets/meta.png";
            } else if (sym == "V") {
              name = "Visa Inc";
              image = "assets/visa.png";
            } else if (sym == "JPM") {
              name = "JPMorgan Chase & Company";
              image = "assets/jpmorgan.png";
            } else if (sym == "JNJ") {
              name = "Johnson & Johnson";
              image = "assets/johnson&johnson.png";
            } else if (sym == "VOD") {
              name = "Vodafone Group plc";
              image = "assets/vodafone.png";
            } else if(sym == "BABA") {
              name = "Alibaba Group Holding Ltd";
              image = "assets/alibaba.jpg";
            }
            else {
              name = "";
              image = "";
            }

            var close = _textEditingController!.text.isNotEmpty
                ? listSearch![index].close
                : listViewModel.stocks[index].close;

            var open = _textEditingController!.text.isNotEmpty
                ? listSearch![index].open
                : listViewModel.stocks[index].open;

            var total = close - open;

            var icon = total > 0 ? const Icon(Icons.upload_rounded, color: Colors.green) : const Icon(Icons.download_rounded, color: Colors.red);
            var totalTradedText = total > 0 ? Text(total.toStringAsFixed(2),
              style: const TextStyle(
                fontFamily: "OpenSans-Bold",
                fontSize: 14,
                color: Colors.green,
              ),
            ) : Text(total.toStringAsFixed(2),
              style: const TextStyle(
                fontFamily: "OpenSans-Bold",
                fontSize: 14,
                color: Colors.red,
              ),
            );
            return GestureDetector(
              onTap: (){
                _showSingleStockDetails(context, _textEditingController!.text.isNotEmpty
                    ? listSearch![index]
                    : listViewModel.stocks[index]);
              },
              child: (
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 0, 2),
                          child: Image.asset(image, width: 30, height: 30,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 0, 2),
                              child: Text(name,
                                style: const TextStyle(
                                  fontFamily: "OpenSans",
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 12, 2),
                              child: totalTradedText,
                            ),
                          ],),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                              child: Text(_textEditingController!.text.isNotEmpty
                                  ? listSearch![index].volume.toString()
                                  : listViewModel.stocks[index].volume.toString(),
                                style: const TextStyle(
                                  fontFamily: 'OpenSans-Bold',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                              child: icon,
                            ),
                          ],)
                      ],
                    ),
                  )
              ),
            );
          },
        ),
      ],
        );
  }

}