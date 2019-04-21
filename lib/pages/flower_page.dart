import 'package:flutter/material.dart';
import 'package:flutter_exchange/objects/flower.dart';

class FlowerPage extends StatefulWidget {
  final Flower _flower;
  final Function _addFlowerToBasket;

  const FlowerPage(this._flower, this._addFlowerToBasket);

  @override
  _FlowerPageState createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController(text: _amount.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text('Flower'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget._flower.title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          widget._flower.description,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${widget._flower.price} ₽',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                child: Image.network(widget._flower.photoPath),
                tag: widget._flower.title,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Available ${widget._flower.available}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _amount--;
                    });
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 3, color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 100,
                  child: TextField(
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(fontSize: 24),
                    keyboardType: TextInputType.numberWithOptions(),
                    textAlign: TextAlign.center,
                    controller: _controller,
                    onChanged: (_) {
                      setState(() {
                        _amount = int.parse(_controller.text);
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _amount++;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Add'),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    widget._addFlowerToBasket(widget._flower, _amount);
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ));
  }
}
