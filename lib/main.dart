import 'package:flutter/material.dart';
import 'flower.dart';
import 'basket_widget.dart';
import 'basket.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
    Flower('Rose', 'V-20'),
    Flower('Tulpan', 'V-45')
  ];

  final Basket _basket = Basket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.shopping_basket),
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BasketPage(_basket)),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext, pos) {
          return ListTile(
            title: Text(flowers[pos].title),
            subtitle: Text(flowers[pos].description),
            onTap: () {
              showModalBottomSheet(
                  context: BuildContext,
                  builder: (context) {
                    return Column(
                      children: <Widget>[
                        Text(flowers[pos].title),
                        TextField(keyboardType: TextInputType.numberWithOptions(),),
                        RaisedButton(
                          child: Text('ADD'),
                          onPressed: () {
                            _basket.addFlower(flowers[pos], 1);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
          );
        },
        itemCount: flowers.length,
      ),
    );
  }
}
