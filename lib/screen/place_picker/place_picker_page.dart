import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';
import '../../components/popup/cafe_tutorial.dart';

import '../../components/ui/my_lists.dart';
import '../../components/ui/popular_spot_lists.dart';
import '../../components/widgets/search_keyword_widget.dart';
import 'place_list_view_page.dart';

class PlacePickerPage extends StatelessWidget {
  const PlacePickerPage({super.key});

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            collapsedHeight: 60.0,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/image_ranking_background.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Center(
                        child: SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/icon_prize.png',
                                    height: 18,
                                  ),
                                  SizedBox(
                                    width: 4.0.w,
                                  ),
                                  Text(
                                    "트랜드 랭킹",
                                    style: TextStyle(
                                      fontFamily: 'PretendardRegular',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFF8F9FA),
                                    ),
                                  ),
                                ],
                              ),
                              IntrinsicWidth(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // 레벨 가이드 페이지 이동
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0.w,
                                      vertical: 6.0.h,
                                    ),
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '성북구 장위동',
                                        style: TextStyle(
                                          fontFamily: 'PretendardRegular',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF343A40),
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.0.w,
                                      ),
                                      Image.asset(
                                        'assets/icons/icon_arrow_triangle.png',
                                        width: 6,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SearchKeywordWidget(),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffF1F3F5),
                    // thickness: 9,
                    height: 1.5.h,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () async {},
                  child: PopularSpotList(
                    name: '${_placeName[index]}',
                    index: index,
                  ),
                ),
                childCount: _placeName.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
