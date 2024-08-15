import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';
import '../../components/ui/list_place_tutorial.dart';

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
      body: Container(
        color: Color(0xFFf5f5f5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                toolbarHeight: 50.0.h,
                expandedHeight: 130.0 + ViewPaddingTopSize(context),
                backgroundColor: Color(0xFFf5f5f5),
                elevation: 0,
                scrolledUnderElevation: 0,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      centerTitle: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/icon_marker.png',
                            height: 16.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                            child: Text(
                              '성북구 장위동',
                              style: TextStyle(
                                fontFamily: 'PretendardRegular',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF343A40),
                                height: 1.5,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icons/icon_arrow_right.png',
                            height: 16.h,
                          ),
                        ],
                      ),
                      background: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: ViewPaddingTopSize(context) + 24.0.h),
                          child: Text(
                            '인기 스팟 랭킹\nBEST 10',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0.sp,
                                height: 1.43,
                                letterSpacing: -0.16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 34.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '지금 핫한 장소 리스트',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0.sp,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0.w,
                              vertical: 8.0.h,
                            ),
                            backgroundColor: Color(0xFF343A40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/icon_map.png',
                                color: Colors.white,
                                height: 16.0.h,
                              ),
                              SizedBox(width: 2.0.w),
                              Text(
                                '지도뷰',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0.h, bottom: 24.0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2.0.h,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0.h),
                        child: ListPlaceTutorial(
                          name: '${_placeName[index]}',
                          index: index,
                        ),
                      ),
                    ],
                  ),
                  childCount: _placeName.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
