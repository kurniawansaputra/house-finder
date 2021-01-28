import 'package:flutter/material.dart';
import 'package:house_finder/theme.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({
    this.index,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/icon_star.png'
          : 'assets/images/icon_star_gray.png',
      width: 18.0,
    );
  }
}
