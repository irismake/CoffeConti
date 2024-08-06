import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Keyword extends StatelessWidget {
  final String keywordName;
  const Keyword({super.key, required this.keywordName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF3D3332),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 2.0.h),
        child: Text(
          keywordName,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 11.0.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
