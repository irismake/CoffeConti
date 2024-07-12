import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  TagButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 5.0.w),
      child: Container(
        height: 20.0.h,
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            backgroundColor: Color(0xFF3D3332),
            elevation: 3,
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
