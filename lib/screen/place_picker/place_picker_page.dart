import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/ui/popular_spot_lists.dart';
import '../../components/widgets/search_keyword_widget.dart';

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
            expandedHeight: 200.0,
            collapsedHeight: 60.0,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.08),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/image_ranking_background.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/icon_prize.png',
                                    height: 18,
                                    color: Color(0xFF343A40),
                                  ),
                                  SizedBox(
                                    width: 6.0.w,
                                  ),
                                  Text(
                                    "트랜드 랭킹",
                                    style: TextStyle(
                                      fontFamily: 'PretendardRegular',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF343A40),
                                      height: 1.43,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IntrinsicWidth(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    side: BorderSide(color: Color(0xFFDEE2E6)),
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.0.w,
                                    vertical: 8.0.h,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '성북구 동선동 1가',
                                      style: TextStyle(
                                        fontFamily: 'PretendardRegular',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF343A40),
                                        height: 1.56,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0.w,
                                    ),
                                    Image.asset(
                                      'assets/icons/icon_arrow_triangle.png',
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                    color: Colors.transparent,
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
                    height: 1.5.h,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: [
                  PopularSpotList(
                    name: '${_placeName[index]}',
                    index: index,
                  ),
                  if (index < _placeName.length - 1)
                    Container(
                      color: Colors.grey[300],
                      height: 1.0,
                    ),
                ],
              ),
              childCount: _placeName.length,
            ),
          ),
        ],
      ),
    );
  }
}
