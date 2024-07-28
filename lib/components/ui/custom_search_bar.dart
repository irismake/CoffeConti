import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final FocusNode focusNode;

  CustomSearchBar({
    Key? key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      autofocus: true,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontFamily: 'PretendardRegular',
        decorationThickness: 0,
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
        height: 1.5,
      ),
      showCursor: true,
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0.h),
        hintText: '검색어를 입력해주세요.',
        hintStyle: TextStyle(
          fontFamily: 'PretendardRegular',
          color: Color(0xffADB5BD),
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 1.5,
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
