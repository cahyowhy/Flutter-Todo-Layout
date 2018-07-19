import 'package:flutter/material.dart';
import 'Home.dart';
import 'Cookies.dart';
import 'Books.dart';
import 'Todo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Flutter Demo',
        routes: <String, WidgetBuilder> {
          '/cookies': (BuildContext context) => new MyScreen(),
          '/books': (BuildContext context) => new BookScreen(),
          '/todos': (BuildContext context) => new TodoScreen(),
        },
        theme: new ThemeData(
          primarySwatch: Colors.purple
        ),
        home: new HomeScreen()
    );
  }
}
