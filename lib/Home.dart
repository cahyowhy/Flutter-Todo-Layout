import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget buttonSection(BuildContext scaffoldContext) {
      Column buildButtonColumn(IconData icon, String label) {
        Color color = Theme.of(context).primaryColor;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(icon, color: color),
                onPressed: () {
                  Scaffold.of(scaffoldContext).showSnackBar(
                      new SnackBar(
                        content: new Text('label '+ label),
                        duration: Duration(seconds: 3),
                        action: new SnackBarAction(
                            label: 'Undo',
                            onPressed: () => Scaffold.of(scaffoldContext).hideCurrentSnackBar()
                        ),
                      )
                  );
                }),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)
              ),
            )
          ],
        );
      }

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButtonColumn(Icons.call, 'CALL'),
            buildButtonColumn(Icons.near_me, 'ROUTE'),
            buildButtonColumn(Icons.share, 'SHARE')
          ],
        ),
      );
    }

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. 
Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. 
A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, 
leads you to the lake, which warms to 20 degrees Celsius in the summer. 
Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''', textAlign: TextAlign.justify),
    );

    Widget buttonMoveIntent = Container(
      child: Container(
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
        child: RaisedButton(
            child: Text('pindah navigasi'),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/cookies')
        ),
      ),
    );

    Widget buttonMoveIntent2 = Container(
      child: Container(
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
        child: RaisedButton(
            child: Text('pindah navigasi ke buku'),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/books')
        ),
      ),
    );

    Widget buttonMoveIntent3 = Container(
      child: Container(
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
        child: RaisedButton(
            child: Text('pindah navigasi ke Todo'),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/todos')
        ),
      ),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Oeschinen Lake Campground',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41')
        ],
      ),
    );

    return  Scaffold(
      appBar: AppBar(
        title: Text('Top lakes'),
      ),
      body: Builder(
          builder: (context) => ListView(
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection(context),
              textSection,
              buttonMoveIntent,
              buttonMoveIntent2,
              buttonMoveIntent3
            ],
          )),
    );
  }
}