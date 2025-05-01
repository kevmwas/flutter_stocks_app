import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/raven.jpg',
              width: 40.0,
              height: 40.0,
              fit: BoxFit.fill,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 0,0,0),
            child: Text('Ticker Stocks',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 30,
              ),
            ),
          ),
        ],
    );
  }
}
