import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/button/category_thumb.dart';
import '../../components/ui/my_groups.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/icons/button_more.png',
              height: 24.h,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'heenano',
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff212529),
                        height: 1.43,
                      ),
                    ),
                    SizedBox(
                      height: 6.0.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 레벨 가이드 페이지 이동
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                          vertical: 4.0.h,
                        ),
                        backgroundColor: Color(0xff02343F),
                        elevation: 0,
                      ),
                      child: Text(
                        '@ 따끈따끈한 뉴비',
                        style: TextStyle(
                          fontFamily: 'PretendardRegular',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF0EDCC),
                          height: 1.43,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '나의 리뷰',
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff343A40),
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
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {},
                      child: CategoryThumb(
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '즐겨찾기',
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff343A40),
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
              ),
              SizedBox(
                height: 144,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {},
                      child: MyGroups(
                        cafeName: '공부 카페 리스트',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
