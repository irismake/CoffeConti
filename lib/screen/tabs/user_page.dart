import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../popup/ cafe_tutorial.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _AddMyCafeState();
}

class _AddMyCafeState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230.0.h,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              //borderRadius: BorderRadius.circular(24),
              // border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0.w,
                right: 16.0.w,
                top: 40.0.h,
                bottom: 30.0.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Image.asset(
                          'assets/icons/button_more.png',
                          height: 24.h,
                        ),
                        onPressed: () {
                          // do something
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '내가만든쿠키',
                              style: TextStyle(
                                fontFamily: 'PretendardRegular',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                height: 1.56,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // 레벨 가이드 페이지 이동
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                minimumSize: Size.zero,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.w,
                                  vertical: 4.0.h,
                                ),
                                backgroundColor: Color(0xFF3D3332),
                                elevation: 0,
                              ),
                              child: Text(
                                '따끈따끈한 뉴비',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                  height: 1.43,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 66.0.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/image_user_profile_1.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   height: 10.0.h,
          //   color: Color(0xffF1F3F5),
          // ),
          Container(
            //color: Color(0xffF1F3F5),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
                vertical: 20.0.h,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '나의 리뷰',
                        style: TextStyle(
                          fontFamily: 'PretendardRegular',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1.56,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.h, horizontal: 2.0.w),
                        ),
                        child: Text(
                          '더보기',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff868E96),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CafeTutorial(
                    cafeName: '커피스토어',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '즐겨찾기',
                        style: TextStyle(
                          fontFamily: 'PretendardRegular',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1.56,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.h, horizontal: 2.0.w),
                        ),
                        child: Text(
                          '더보기',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff868E96),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CafeTutorial(
                    cafeName: '커피스토어',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
