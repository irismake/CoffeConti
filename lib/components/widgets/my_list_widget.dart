import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/my_lists.dart';

class MyListWidget extends StatelessWidget {
  final int categoryId;
  const MyListWidget({
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
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: MyLists(
              searchText: '${_placeName[index]}',
              index: index,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Color(0xffF1F3F5),
            // thickness: 9,
            height: 1.5.h,
          );
        },
      ),
    );
  }
}
