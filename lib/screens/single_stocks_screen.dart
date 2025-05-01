import 'package:flutter/material.dart';

import '../view_models/stock_view_model.dart';

class SingleStockDetailScreen extends StatelessWidget {
  final StocksViewModel stock;
  const SingleStockDetailScreen ({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {

    var sym = this.stock.symbol;
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
      throw Exception('Unknown Ticker');
    }

    var open = this.stock.open == null ? "0": this.stock.open.toString();
    var close = this.stock.close == null ? "0" : this.stock.close.toString();
    var high = this.stock.high == null ? "0" : this.stock.high.toString();
    var low = this.stock.low == null ? "0" : this.stock.low.toString();
    var volume = this.stock.volume == null ? "0" : this.stock.volume.toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(153, 204, 255, 1.0),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(image, height: 80, width: 80,),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: Text(name, overflow: TextOverflow.visible, style: const TextStyle(
                        fontSize: 22,
                        letterSpacing: 2.0,
                        fontFamily: 'OpenSans-Bold',
                        color: Colors.black
                    ),),
                  ),
                  const SizedBox(height: 10, width: 10,),
                  Text(this.stock.symbol, style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.0,
                      fontFamily: 'OpenSans-Light',
                      color: Colors.black
                  ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.stock.date, style: const TextStyle(
                  fontFamily: "OpenSans"
                ),),
              ),
              const SizedBox(height: 10,),
              const Card(
                elevation: 0,
                color: Color.fromRGBO(153, 204, 255, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: (Text('OverView', style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 24,
                  ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 2),
                    child: Text('Opening', style: TextStyle(
                      fontFamily: "OpenSans-Bold",
                      fontSize: 18,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 2),
                    child: Text('Closing', style: TextStyle(
                      fontFamily: "OpenSans-Bold",
                      fontSize: 18,
                    ),),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Text(open ?? "0", style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 18,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Text(close ?? "0", style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 18,
                    ),),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 2),
                    child: Text('Highest', style: TextStyle(
                      fontFamily: "OpenSans-Bold",
                      fontSize: 18,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 2),
                    child: Text('Lowest', style: TextStyle(
                      fontFamily: "OpenSans-Bold",
                      fontSize: 18,
                    ),),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Text(high ?? "0", style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 18,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Text(low ?? "0", style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 18,
                    ),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                  const Text("Volume Traded", style: TextStyle(
                    fontFamily: "OpenSans-Bold",
                    fontSize: 22,
                  ),),
                  Text(volume ?? "0", style: const TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 14,
                  ),),
                ],),
              )
              ],
          ),
        ),
      ),
    );
  }
}
