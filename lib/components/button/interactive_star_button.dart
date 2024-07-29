import 'package:flutter/material.dart';

class InteractiveStarButton extends StatefulWidget {
  final ValueChanged<int> onRatingSelected; // 선택된 별점 전달

  const InteractiveStarButton({
    Key? key,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  _InteractiveStarButtonState createState() => _InteractiveStarButtonState();
}

class _InteractiveStarButtonState extends State<InteractiveStarButton> {
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
              index < _currentRating
                  ? Icons.star_rounded
                  : Icons.star_border_rounded,
              color: index < _currentRating
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
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
