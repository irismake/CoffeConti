import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/constants/screenSize.dart';
import '../../components/widgets/my_review_widget.dart';
import '../../components/ui/my_groups.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFf5f5f5),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.0.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ViewPaddingTopSize(context) + 10.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Image.asset(
                                'assets/icons/button_more.png',
                                fit: BoxFit.contain,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 18.0.w),
                            child: Container(
                              height: 82.0.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/image_user_profile_1.png',
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'heenano',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff212529),
                                  height: 1.43,
                                ),
                              ),
                              SizedBox(
                                height: 6.0.h,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.w,
                                    vertical: 4.0.h,
                                  ),
                                  backgroundColor: Color(0xff02343F),
                                  elevation: 0,
                                ),
                                child: Text(
                                  '@ 따끈따끈한 뉴비',
                                  style: TextStyle(
                                    fontFamily: 'PretendardRegular',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFF0EDCC),
                                    height: 1.43,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icon_review.png',
                                  height: 12,
                                  color: Color(0xffADB5BD),
                                ),
                                SizedBox(
                                  width: 4.0.w,
                                ),
                                Text(
                                  '리뷰',
                                  style: TextStyle(
                                    fontFamily: 'PretendardRegular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffADB5BD),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '내가 쓴 리뷰',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff343A40),
                                  height: 1.56,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.h, horizontal: 2.0.w),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  '더보기',
                                  style: TextStyle(
                                    fontFamily: 'PretendardRegular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffADB5BD),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 4.0.w,
                                mainAxisSpacing: 0,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: 6, // 아이템 수
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    // Handle tap
                                  },
                                  child: MyReviewWidget(
                                    index: index,
                                  ),
                                );
                              },
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 34.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icon_bookmark_fill.png',
                                  height: 12,
                                  color: Color(0xffADB5BD),
                                ),
                                SizedBox(
                                  width: 4.0.w,
                                ),
                                Text(
                                  '북마크',
                                  style: TextStyle(
                                    fontFamily: 'PretendardRegular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffADB5BD),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '북마크 리스트',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff343A40),
                                  height: 1.56,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.h, horizontal: 2.0.w),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  '더보기',
                                  style: TextStyle(
                                    fontFamily: 'PretendardRegular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffADB5BD),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 144,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {},
                        child: MyGroups(
                          cafeName: '공부 카페 리스트',
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 12.0.w,
                      );
                    },
                  ),
                ),
                SizedBox(height: 34.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
