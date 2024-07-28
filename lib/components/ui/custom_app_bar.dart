import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
  });

  @override
  Size get preferredSize => Size.fromHeight(64.0.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(64.0.h),
      child: AppBar(
        toolbarHeight: 64.0.h,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        // shape: const Border(
        //   bottom: BorderSide(
        //     color: Color(0xffb2b2b2),
        //     width: 0.5,
        //   ),
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //뒤로가기
          },
          icon: Image.asset(
            'assets/icons/icon_go_back.png',
            height: 20.h,
          ),
        ),
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.0.sp,
            height: 1.56,
          ),
        ),
      ),
    );
  }
}
