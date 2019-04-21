import 'package:flutter/material.dart';
import 'package:flutter_exchange/objects/flower.dart';

class ListItem extends StatelessWidget {
  final Flower _flower;
  final Function _onTap;

  const ListItem(this._flower, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Hero(child: Image.network(_flower.photoPath), tag: _flower.title,),
            backgroundColor: Colors.transparent,
          ),
          title: Text(_flower.title),
          subtitle: Text('${_flower.description}, ${_flower.country}'),
          isThreeLine: true,
          trailing: Column(
            children: <Widget>[
              Text('${_flower.price} ₽', style: Theme.of(context).textTheme.body2.copyWith(fontSize: 18)),
              SizedBox(height: 20,),
              Text('${_flower.available} шт.')
            ],
          ),
          onTap: (){_onTap(_flower);},
        ),
        Divider()
      ],
    );
  }
}
