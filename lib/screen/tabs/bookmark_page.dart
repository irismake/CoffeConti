import 'package:coffeeconti/widgets/bookmark_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _groupNames = [
      '공부 카페 리스트',
      '제주도 여행',
      '성수 직장인 추천',
      '용산 데이트 코스',
      '24시 약국',
      '디저트 맛집 카페',
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ViewPaddingTopSize(context) + 10.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '그룹',
                        style: TextStyle(
                          fontFamily: 'PretendardRegular',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1.56,
                        ),
                      ),
                      SizedBox(
                        width: 6.0.w,
                      ),
                      SizedBox(
                        // color: Colors.pink,
                        height: 16.0.h,
                        child: Image.asset(
                          'assets/icons/icon_bookmark_fill.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '추가',
                    style: TextStyle(
                      fontFamily: 'PretendardRegular',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff868E96),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(vertical: 20),
                crossAxisCount: 2, // 한 행에 보여줄 아이템 수
                crossAxisSpacing: 12.0.w, // 아이템 사이의 가로 간격
                mainAxisSpacing: 16.0, // 아이템 사이의 세로 간격
                childAspectRatio: 0.8,
                children: List.generate(
                  6,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookmarkListWidget(
                                groupName: _groupNames[index]),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180.0.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 0.5,
                                color: Colors.black.withOpacity(0.08),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${_groupNames[index]}',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff343A40),
                                ),
                              ),
                              Text(
                                '   (9)',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff868E96),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
