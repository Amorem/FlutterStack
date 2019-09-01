import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: ListView.separated(
        itemCount: 25,
        itemBuilder: (context, index) => createSquare(index),
        separatorBuilder: (context, index) => createSeparator(index),
      ),
    );
  }
}

List<Widget> showPizzaLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildren = List<Widget>();

  Container backGround = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('http://bit.ly/pizzaimage'),
        fit: BoxFit.fitHeight,
      ),
    ),
  );

  Positioned pizzaCard = Positioned(
    top: sizeX / 20,
    left: sizeY / 20,
    child: Card(
      elevation: 12,
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Pizza Margherita',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange[800],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'This delicious pizza is made of Tomato,\n Mozzarella, and Basil. \n\n Seriously you can\'t miss it',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Positioned buttonOrder = Positioned(
    bottom: sizeY / 20,
    left: sizeX / 20,
    width: sizeX - sizeX / 10,
    child: RaisedButton(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.orange[900],
      child: Text(
        'Order Now !',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {},
    ),
  );

  layoutChildren.add(backGround);
  layoutChildren.add(pizzaCard);
  layoutChildren.add(buttonOrder);
  return layoutChildren;
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = List<Widget>();
  squares.add(Container(color: Colors.black));

  while (i < numSquares) {
    Container square = Container(
      color: colors[i % 5],
      height: 100,
      width: 100,
      child: Text(i.toString()),
    );

    i++;
    squares.add(square);
  }
  return squares;
}

Widget createSquare(int position) {
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];

  Container square = Container(
    color: colors[position % 5],
    height: 100,
    width: 100,
    child: Text(position.toString()),
  );

  return square;
}

Widget createSeparator(int position) {
  Widget separator = Container(height: 15, color: Colors.black);
  return separator;
}
