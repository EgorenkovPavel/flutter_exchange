import 'package:flutter/material.dart';
import 'package:flutter_exchange/objects/basket.dart';
import 'package:flutter_exchange/widgets/basket_item.dart';

class BasketPage extends StatelessWidget {
  final Basket _basket;

  const BasketPage(this._basket);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, pos) {
                return BasketItem(_basket.getFlower(pos), _basket.getAmount(pos));
              },
              itemCount: _basket.getLength(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('Total sum')),
                Text(_basket.getTotalSum().toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
