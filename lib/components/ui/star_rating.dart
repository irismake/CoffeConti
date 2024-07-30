import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Stack(
            children: [
              Icon(
                Icons.star_rounded,
                color: Color(0xFFE9ECEF),
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
