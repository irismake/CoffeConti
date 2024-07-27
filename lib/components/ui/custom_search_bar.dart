import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  final bool autoFocus;
  final bool enabled;

  CustomSearchBar({
    Key? key,
    required this.autoFocus,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      style: TextStyle(
        fontFamily: 'PretendardRegular',
        decorationThickness: 0,
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
        height: 1.5,
      ),
      showCursor: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF5F6F7),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0.h),
        hintText: '검색어를 입력해주세요.',
        hintStyle: TextStyle(
          fontFamily: 'PretendardRegular',
          color: Color(0xff868E96),
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0.w,
          height: 1.3,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1.w, color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1.w, color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1.w, color: Colors.transparent),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 17.0.w, right: 11.0.w),
          child: Icon(
            Icons.search_rounded,
            size: 20,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        prefixIconColor: Color(0xff868E96),
      ),
    );
  }
}
