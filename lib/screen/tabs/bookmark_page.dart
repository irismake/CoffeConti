import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          children: [
            SizedBox(
              height: ViewPaddingTopSize(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              child: SearchBar(
                autoFocus: false,
                enabled: false,
              ),
            ),
            Expanded(
              child: DynamicHeightGridView(
                itemCount: 6,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0.w,
                mainAxisSpacing: 0.0.h,
                builder: (ctx, index) {
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
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0.h),
                      child: Container(
                        height: 218.0.h,
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
                            vertical: 22.0,
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
                      ),
                    ),
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
