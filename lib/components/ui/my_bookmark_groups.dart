import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screen/bookmark/my_bookmark_list_page.dart';
import '../button/review_button.dart';
import 'keyword.dart';

class MyBookmarkGroups extends StatelessWidget {
  final int index;

  MyBookmarkGroups({
    super.key,
    required this.index,
  });

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
    return Container(
      width: 240.0.w,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MyBookmarkListPage(groupName: _groupNames[index]),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${_groupNames[index]}',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff343A40),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          ' (9)',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff868E96),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.0.h,
                    ),
                    index != 0
                        ? Text(
                            '공부하기 좋은 서울 카페 리스트',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868E96),
                              height: 1.43,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                index != 0 && index != 2
                    ? Row(
                        children: [
                          Keyword(keywordName: '공부'),
                          SizedBox(width: 6.0),
                          Keyword(keywordName: '디저트'),
                        ],
                      )
                    : ReviewButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String limitTextLength(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + "...";
    }
  }
}
