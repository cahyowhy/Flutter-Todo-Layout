import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget { 

  int favCount;

  FavoriteWidget({@required this.favCount});

  @override
  _FavState createState() => new _FavState(favCount);
}

class _FavState extends State<FavoriteWidget> {

  bool _isFavorited = false;
  int _favCount;

  _FavState(this._favCount);

  _toggleFavourite() {
    this.setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favCount -= 1;
      } else {
        _isFavorited = true;
        _favCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: IconButton(
          icon: Icon(_isFavorited ? Icons.star : Icons.star_border),
          color: Colors.red,
          onPressed: _toggleFavourite,
        )),
        Flexible(child: Text('Total like ${_favCount}'), flex: 1)
      ],
    );
  }
}
