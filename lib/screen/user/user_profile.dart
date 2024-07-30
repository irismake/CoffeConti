import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/popup/cafe_tutorial.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.25),
        //title: Text('My App'),
        actions: <Widget>[
          IconButton(
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
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.25),
            height: 240.0.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.0.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/image_user_profile_1.png',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 레벨 가이드 페이지 이동
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
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
                Text(
                  '커피맘모스',
                  style: TextStyle(
                    fontFamily: 'PretendardRegular',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff495057),
                    height: 1.43,
                  ),
                ),
              ],
            ),
          ),
          Container(
              //height: 10.0.h,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   //borderRadius: BorderRadius.circular(10.0),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.4),
              //       spreadRadius: 10,
              //       blurRadius: 50.0,
              //       offset: Offset(0, 5),
              //     ),
              //   ],
              // ),
              // decoration: BoxDecoration(
              //   color: Color(0xffF1F3F5),
              //   borderRadius: BorderRadius.circular(24),
              //   border: Border.all(color: Colors.black.withOpacity(0.1)),
              // ),
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0.w,
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
                  name: '커피스토어',
                  index: 0,
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
                  name: '커피스토어',
                  index: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
