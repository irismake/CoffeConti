import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/ui/keyword.dart';

class BookmarkList extends StatelessWidget {
  final int categoryId;
  const BookmarkList({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    List<String> _placeName = [
      '커피스토어',
      '스타벅스 종암 DT점',
      '당가라 과자점',
      '코스모',
      '브라운 헤이브',
      'coffeeconti'
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        scrollDirection: Axis.vertical,
        itemCount: _placeName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: SearchItemWidget(
              searchText: '${_placeName[index]}',
              index: index,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Color(0xffDEE2E6),
            thickness: 1,
            height: 2.0.h,
          );
        },
      ),
    );
  }
}

class SearchItemWidget extends StatelessWidget {
  final String searchText;
  final int index;

  const SearchItemWidget({required this.searchText, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: ShapeDecoration(
              color: Color(0xffF1F3F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: index == 0
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                        4), // RoundedRectangleBorder와 같은 반경 사용

                    child: Image.asset(
                      'assets/images/IMG_4498.png',
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox.shrink(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$searchText',
                  style: TextStyle(
                    color: Color(0xFF343A40),
                    fontSize: 18.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 8.0,
                ),
                index == 0
                    ? Row(
                        children: [
                          KeyWord(keyWordName: '공부'),
                          SizedBox(width: 6.0),
                          KeyWord(keyWordName: '디저트'),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          // Image.asset(
          //   'assets/icons/icon_bookmark_fill.png',
          //   height: 20.0.h,
          // ),
        ],
      ),
    );
  }
}
