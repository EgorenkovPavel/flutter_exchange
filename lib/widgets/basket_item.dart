import 'package:flutter/material.dart';
import 'package:flutter_exchange/objects/flower.dart';

class BasketItem extends StatelessWidget{

  final Flower _flower;
  final int _amount;

  const BasketItem(this._flower, this._amount);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_flower.title),
      subtitle: Text(_flower.description),
      trailing: Column(
        children: <Widget>[
          Text(_amount.toString()),
          Text(_flower.price.toString()),
          Text('${_flower.price * _amount}'),
        ],
      ),
    );
  }

}