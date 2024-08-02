import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int maximumScore;

  const StarRating({
    Key? key,
    required this.rating,
    required this.maximumScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(maximumScore, (index) {
          return Stack(
            children: [
              Image.asset(
                'assets/icons/icon_star.png',
              ),
              if (index < rating)
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: (index + 1 > rating) ? rating - index : 1,
                    child: Icon(
                      Icons.star_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
