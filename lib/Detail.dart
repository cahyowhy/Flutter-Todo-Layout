import 'package:flutter/material.dart';
import 'RatingBar.dart';
import 'book_datas.dart';

class Detail extends StatelessWidget {
  final Book book;

  Detail(this.book);

  @override
  Widget build(BuildContext context) {

    Widget text (String data, {Color color = Colors.black87,
      num size = 14, EdgeInsetsGeometry padding = EdgeInsets.zero,
      bool isBold = false}) {

      return Padding(
        padding: padding,
        child: Text(data,
            style: TextStyle(
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal
            )
        ),
      );
    }

    final Widget topLeftWidget = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
            tag: book.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: InkWell(
                onTap: () {
                  debugPrint('SUP gay');
                },
                child: Image(image: AssetImage(book.image), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        text('${book.pages} pages', color: Colors.black38, size: 12.0)
      ],
    );

    final Widget topRightWidget = Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(book.title, size: 16.0, isBold: true, padding: EdgeInsets.only(top: 16.0)),
          text("by ${book.writer}", color: Colors.black54, size: 12,
              padding: EdgeInsets.only(top: 8.0, bottom: 16.0)
          ),
          Row(
            children: <Widget>[
              text(book.price, isBold: true, padding: const EdgeInsets.only(right: 8.0)),
              RatingBar(rating: book.rating),
            ],
          ),
          SizedBox(height: 32.0),
          Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blue.shade200,
            elevation: 5.0,
            child: MaterialButton(
                onPressed: ()=>debugPrint('sup gays'),
                minWidth: 160.0,
                color: Colors.blue,
                child: text('BUY IT NOW!!', color: Colors.white, size: 13),
            )
          )
        ]
    );

    final topContent = Container(
      color: Colors.yellow,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeftWidget),
          Flexible(flex: 3, child: topRightWidget)
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold
            )
        ),
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black87),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => debugPrint('hy gay')
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          topContent,
          Flexible(child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Text(book.description, textAlign: TextAlign.justify, style: TextStyle(
                fontSize: 16.0, height: 1.5
            )),
          ))
        ],
      ),
    );
  }
}
