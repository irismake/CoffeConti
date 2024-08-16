import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewButton extends StatelessWidget {
  const ReviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Color(0xFFF1F3F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 8.0.w),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        '리뷰작성',
        style: TextStyle(
          color: Color(0xFF868E96),
          fontSize: 11.0.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
      ),
    );
  }
}
