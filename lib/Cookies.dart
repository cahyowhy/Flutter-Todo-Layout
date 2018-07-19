import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cookies now')),
      body: Container(
        height: 130.0,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color> [
            Colors.blueAccent,
            Colors.purpleAccent
          ], begin: const Alignment(0.0, -1.0), end: const Alignment(0.0, 0.6) )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                        'Strawbery hmm',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        )
                    ),
                    new Text('Strawbery hmm tasty tasty strawberry dawd dakdawj dkjwadawd daw',
                        overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(color: Colors.white))
                  ],
                ), flex: 3),
                new Expanded(child: Image.asset(
                  'images/lake.jpg',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ), flex: 2)
              ],
            )
          ],
        ),
      ),
    );
  }
}
