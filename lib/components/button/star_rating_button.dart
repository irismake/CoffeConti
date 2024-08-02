import 'package:flutter/material.dart';

class StarRatingButton extends StatefulWidget {
  final ValueChanged<int> onRatingSelected; // 선택된 별점 전달

  const StarRatingButton({
    Key? key,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  _StarRatingButtonState createState() => _StarRatingButtonState();
}

class _StarRatingButtonState extends State<StarRatingButton> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 30,
          height: 30,
          child: IconButton(
            iconSize: 30,
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.star_rounded,
              color: index < _currentRating
                  ? Theme.of(context).primaryColor
                  : Color(0xFFE9ECEF),
            ),
            onPressed: () {
              setState(() {
                _currentRating = index + 1;
              });
              widget.onRatingSelected(_currentRating); // 선택된 별점 전달
            },
          ),
        );
      }),
    );
  }
}
