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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50.h,
            width: 70.w,
            // color: Colors.pink,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                tabName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pageState ? Color(0xFF343A40) : Color(0xff868E96),
                  fontSize: pageState ? 24.sp : 16.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1.5.h,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0.w,
          ),
          pageState
              ? Center(
                  child: Container(
                    width: 3.0.w,
                    height: 26.h,
                    color: Colors.black,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
