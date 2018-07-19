import 'book_datas.dart';
import 'Detail.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget createTile(Book book) {
      return Hero(
        tag: book.title,
        child: Material(
          elevation: 15.0,
          shadowColor: Colors.yellow.shade900,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context)  => new Detail(book)));
            },
            child: Image(image: AssetImage(book.image), fit: BoxFit.cover),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(elevation: 3.0, title: Text('Its a book')),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid.count(
                childAspectRatio: 2 / 3,
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                children: books.map((Book book) => createTile(book)).toList(),
              ),
            )
          ],
        ));
  }
}
