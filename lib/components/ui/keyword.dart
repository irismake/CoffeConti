import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyWord extends StatelessWidget {
  final String keyWordName;
  const KeyWord({super.key, required this.keyWordName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF1F3F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 3.0.h),
        child: Text(
          keyWordName,
          style: TextStyle(
            color: Color(0xFF868E96),
            fontSize: 12.0.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
