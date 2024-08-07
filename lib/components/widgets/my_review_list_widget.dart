import 'package:coffeeconti/components/ui/my_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyReviewListWidget extends StatelessWidget {
  const MyReviewListWidget({
    super.key,
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
      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 18.0),
        scrollDirection: Axis.vertical,
        itemCount: _placeName.length,
        itemBuilder: (context, index) {
          return MyReview(
            searchText: '${_placeName[index]}',
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            // color: Color(0xffF1F3F5),
            // // thickness: 9,
            height: 8.0,
          );
        },
      ),
    );
  }
}
