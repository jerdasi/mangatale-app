import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBintangWidget extends StatelessWidget {
  double rating;
  RatingBintangWidget({Key? key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          maxRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 16,
          itemBuilder: (BuildContext context, int index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
          onRatingUpdate: (double rating) {}),
    );
  }
}
