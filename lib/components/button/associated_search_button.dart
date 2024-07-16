import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class AssociatedSearchButton extends StatefulWidget {
  const AssociatedSearchButton({
    Key? key,
    required this.interest,
  }) : super(key: key);

  final String interest;

  @override
  State<AssociatedSearchButton> createState() => _AssociatedSearchButtonState();
}

class _AssociatedSearchButtonState extends State<AssociatedSearchButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: double.infinity,
        color: _isSelected ? Colors.grey[400] : Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
