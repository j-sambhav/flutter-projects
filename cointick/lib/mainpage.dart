import 'package:flutter/material.dart';
import 'data.dart';

class Coinpage extends StatefulWidget {
  @override
  _CoinpageState createState() => _CoinpageState();
}

CoinData coinData = CoinData();
List<DropdownMenuItem> dropDownItems = [];
DropdownMenuItem newItem;
void getDropdownItems() {
  for (int i = 0; i < currenciesList.length; i++) {
    String currency = currenciesList[i];
    newItem = DropdownMenuItem(
      child: Text(currency),
      value: currency,
    );
    dropDownItems.add(newItem);
  }
}

class _CoinpageState extends State<Coinpage> {
  String selectedCurrency;
  @override
  Widget build(BuildContext context) {
    getDropdownItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('COINTICK'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFF1D1E33),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedCurrency,
              items: dropDownItems,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                  print(selectedCurrency);
                  print(value);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
