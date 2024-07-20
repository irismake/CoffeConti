import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/list/user_place.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        Theme.of(context).primaryColor.withOpacity(0.2);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.pink,
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
            child: Padding(
              padding:
                  EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 20.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 18.0.w),
                    child: Container(
                      height: 82.0.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/image_user_profile_1.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'heenano',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff343A40),
                            height: 1.43,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 레벨 가이드 페이지 이동
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            // 패딩을 0으로 설정
                            minimumSize: Size.zero, // 최소 크기를 0으로 설정
                            tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap, // 터치 대상 크기 조정
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0.w,
                              vertical: 4.0.h,
                            ),
                            backgroundColor: Color(0xFF3D3332),
                            elevation: 0,
                          ),
                          child: Text(
                            '@ 따끈따끈한 뉴비',
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
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xfff8f8f8),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0.h,
                  horizontal: 16.0.w,
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
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
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
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {},
                            child: UserPlace(
                              cafeName: '커피스토어',
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 28.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '즐겨찾기',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
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
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {},
                            child: UserPlace(
                              cafeName: '커피스토어',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
