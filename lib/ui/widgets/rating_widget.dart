import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBintangWidget extends StatelessWidget {
  final double rating;
  RatingBintangWidget({Key? key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (BuildContext context, int index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 16,
      rating: rating,
    );
  }
}
