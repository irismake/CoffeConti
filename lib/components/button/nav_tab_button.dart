import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavTabButton extends StatelessWidget {
  final bool isSelected;
  final String iconName;
  final VoidCallback onTap;

  const NavTabButton({
    super.key,
    required this.isSelected,
    required this.iconName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          child: Image.asset(
            'assets/icons/${iconName}_fill.png',
            color: isSelected ? Color(0xffFFBE98) : Colors.grey[600],
            height: 22.h,
          ),
        ),
      ),
    );
  }
}
