import 'package:flutter/material.dart';
import 'basket.dart';

class BasketPage extends StatelessWidget{

  final Basket _basket;

  const BasketPage(this._basket);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basket'),
        ),
        body: ListView.builder(itemBuilder: (context, pos){
          return ListTile(
            title: Text(_basket.getFlower(pos).title),
            trailing: Text(_basket.getAmount(pos).toString()),
          );
        },
        itemCount: _basket.getLength(),
        ),
    );
  }
}