import 'package:flutter/material.dart';
import 'package:flutter_exchange/objects/flower.dart';
import 'package:flutter_exchange/pages/flower_page.dart';
import 'package:flutter_exchange/pages/basket_page.dart';
import 'package:flutter_exchange/objects/basket.dart';
import 'package:flutter_exchange/widgets/list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orange,
      ),
      home: MyHomePage(title: '7Flowers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Flower> flowers = [
    Flower(
        title: 'Rose',
        description: 'V-34',
        color: Colors.blue,
        country: 'Spain',
        multiplicity: 1,
        available: 110,
        price: 130),
    Flower(
        title: 'Tulpan',
        description: 'V-20',
        color: Colors.red,
        country: 'Poland',
        multiplicity: 10,
        available: 200,
        price: 35)
  ];

  final Basket _basket = Basket();

  _onTapFlower(Flower _flower) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FlowerPage(_flower, _onAddFlowerToBasket)),
    );
  }

  _onAddFlowerToBasket(Flower _flower, int amount) {
    _basket.addFlower(_flower, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list, color: Colors.white,),),
          IconButton(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.shopping_basket),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(color: Theme.of(context).accentColor, borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Text(
                      '${_basket.getLength()}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  top: 0,
                  right: 0,
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketPage(_basket)),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, pos) {
          Flower _flower = flowers[pos];
          return ListItem(_flower,
            _onTapFlower
          );
        },
        itemCount: flowers.length,
      ),
    );
  }
}
