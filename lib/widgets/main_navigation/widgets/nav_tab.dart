import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.iconName,
  });

  final bool isSelected;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isSelected
          ? 'assets/icons/${iconName}_fill.png'
          : 'assets/icons/${iconName}_light.png',
      height: 32.0.h,
      width: 32.0.w,
    );
  }
}
