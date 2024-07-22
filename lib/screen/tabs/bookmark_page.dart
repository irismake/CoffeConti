import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/button/custom_search_bar.dart';
import '../../components/constants/screenSize.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _categoryImages = [
      'cafe',
      'restaurant',
      'convenience_store',
      'movie',
      'parking',
      'hospital'
    ];
    List<String> _categoryNames = [
      '카페',
      '음식점',
      '편의점',
      '영화관',
      '주차장',
      '병원',
    ];
    return Scaffold(
      //   appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ViewPaddingTopSize(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              child: CustomSearchBar(
                autoFocus: false,
                enabled: false,
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2, // 한 행에 보여줄 아이템 수
                crossAxisSpacing: 12.0.w, // 아이템 사이의 가로 간격
                mainAxisSpacing: 20.0.h, // 아이템 사이의 세로 간격
                children: List.generate(6, (index) {
                  return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ListDetailPage(
                        //       listId: myGroupLists[index].id,
                        //       isBookmarked: myGroupLists[index].isBookmarked,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 85,
                                width: 95,
                                child: Image.asset(
                                  'assets/images/image_thumb_${_categoryImages[index]}.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              Text(
                                '${_categoryNames[index]}',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff868E96),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
