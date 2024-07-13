import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeywordButton extends StatefulWidget {
  const KeywordButton({
    Key? key,
    required this.keywordName,
  }) : super(key: key);

  final String keywordName;

  @override
  State<KeywordButton> createState() => _KeywordButtonState();
}

class _KeywordButtonState extends State<KeywordButton> {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          vertical: 10.0.h,
          horizontal: 20.0.w,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: Text(
          widget.keywordName,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
