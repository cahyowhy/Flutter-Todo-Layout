import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingBar(
      {this.starCount = 5, this.rating = 0.0, this.color = Colors.black87});

  Widget buildStar(BuildContext context, int index) {
    IconData iconData = Icons.star;
    Color iconColor = color;

    if (index >= rating) {
      iconData = Icons.star_border;
      iconColor = color.withOpacity(0.65);
    } else if (index > rating - 1 && index < rating) {
      iconData = Icons.star_half;
    }

    return Icon(iconData, size: 16.0, color: iconColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }
}
