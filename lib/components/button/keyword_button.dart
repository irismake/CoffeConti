import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeywordButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  KeywordButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
              vertical: 6.0.h,
            ),
            backgroundColor: Color(0xFF3D3332),
            elevation: 0,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'PretendardRegular',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              height: 1.43,
            ),
          ),
        ),
      ),
    );
  }
}
