import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('My App'),
        actions: <Widget>[
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Image.asset(
              'assets/icons/button_user_setting.png',
              height: 32.h,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.w,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200.0.h,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        color: Color(0xff212529),
                        height: 1.43,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0.w,
              ),
              child: Container(
                //color: Colors.amber,
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '13',
                          style: TextStyle(
                            color: Color(0xff495057),
                            fontSize: 16.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '게시글',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '팔로워',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '팔로잉',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
