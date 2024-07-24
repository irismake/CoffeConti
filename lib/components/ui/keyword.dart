import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Keyword extends StatelessWidget {
  final String keywordName;
  const Keyword({super.key, required this.keywordName});

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
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 3.0.h),
        child: Text(
          keywordName,
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
