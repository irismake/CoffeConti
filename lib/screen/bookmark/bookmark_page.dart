import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';
import '../../components/ui/my_bookmark_groups.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _groupNames = [
      '전체',
      '공부 카페 리스트',
      '제주도 여행',
      '성수 직장인 추천',
      '용산 데이트 코스',
      '24시 약국',
      '디저트 맛집 카페',
    ];
    return Scaffold(
      body: Container(
        color: Color(0xFFF8F9FA),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: ViewPaddingTopSize(context) + 24.0.h,
                  bottom: 10.0.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '아보카도',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 28.0.sp,
                              height: 1.43,
                              letterSpacing: -0.16,
                            ),
                          ),
                          TextSpan(
                            text: ' 님의\n북마크 그룹',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0.sp,
                              height: 2,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '+ 추가',
                      style: TextStyle(
                          fontFamily: 'PretendardRegular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343A40),
                          height: 1.43),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 20.0.h),
                  scrollDirection: Axis.vertical,
                  itemCount: _groupNames.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 124.0.h,
                      child: MyBookmarkGroups(
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10.0.h,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
