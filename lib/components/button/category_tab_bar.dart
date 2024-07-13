import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabBar extends StatelessWidget {
  final bool pageState;
  final String tabName;
  final VoidCallback onTap;

  const CategoryTabBar({
    super.key,
    required this.pageState,
    required this.tabName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50.h,
        width: 70.w,
        color: pageState ? Colors.teal : Colors.transparent,
        child: Center(
          child: Text(
            tabName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: pageState ? Color(0xFF343A40) : Color(0xff868E96),
              fontSize: pageState ? 20.sp : 16.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 1.5.h,
            ),
          ),
        ),
      ),
    );
  }
}
