import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';
import '../../components/popup/cafe_tutorial.dart';

import '../../components/ui/custom_app_bar.dart';
import '../../components/widgets/search_keyword_widget.dart';

class PlaceListViewPage extends StatelessWidget {
  const PlaceListViewPage({super.key});

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
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: '지금 핫한 장소'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                scrollDirection: Axis.vertical,
                itemCount: _placeName.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {},
                    child: CafeTutorial(
                      name: '${_placeName[index]}',
                      index: index,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1.0,
                    color: Color(0xFFDEE2E6),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
