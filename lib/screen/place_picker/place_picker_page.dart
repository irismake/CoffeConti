import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';
import '../../components/popup/cafe_tutorial.dart';

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
      'coffeeconti'
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(
            top: ViewPaddingTopSize(context) + 10.0.h,
            left: 16.0.w,
            bottom: 10.0.h,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/image_logo.png',
              ),
            ],
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: Color(0xffb2b2b2),
            width: 1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: ViewPaddingTopSize(context) + 10.0.h,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     vertical: 10.0.h,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         '랭킹',
            //         style: TextStyle(
            //           fontFamily: 'PretendardRegular',
            //           fontSize: 20.sp,
            //           fontWeight: FontWeight.w700,
            //           color: Colors.black,
            //           height: 1.56,
            //         ),
            //       ),
            //       Text(
            //         '추가',
            //         style: TextStyle(
            //           fontFamily: 'PretendardRegular',
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w600,
            //           color: Color(0xff343A40),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '내가 북마크한 리스트',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('더보기');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceListViewPage()),
                        );
                      },
                      child: Text(
                        '더보기',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0.sp,
                          color: Color(0xff868E96),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 24.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0.h,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      scrollDirection: Axis.horizontal,
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
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '근처 핫플레이스',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('더보기');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceListViewPage()),
                        );
                      },
                      child: Text(
                        '더보기',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0.sp,
                          color: Color(0xff868E96),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 24.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0.h,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      scrollDirection: Axis.horizontal,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
