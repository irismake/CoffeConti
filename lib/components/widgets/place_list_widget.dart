import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/list_place_tutorial.dart';

class PlaceListWidget extends StatelessWidget {
  const PlaceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _placeName = [
      '커피스토어',
      '스타벅스 종암 DT점',
      '당가라 과자점',
      '코스모',
      '브라운 헤이브',
      'coffeeConti',
      '동소문피스커피',
      '베이커스 코드',
      '개화가배',
      '코무(KOMU)'
    ];
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 10.0),
        itemBuilder: (context, index) {
          return ListPlaceTutorial(
            name: '${_placeName[index]}',
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10.0,
          );
        },
      ),
    );
  }
}
