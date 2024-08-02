import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'keyword.dart';
import 'star_rating.dart';

class PopularSpotList extends StatelessWidget {
  final String name;
  final int index;
  const PopularSpotList({
    super.key,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('gg');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 20.0.w),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#카페',
                            style: TextStyle(
                              color: Color(0xFF868E96),
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            limitTextLength(name, 15),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF343A40),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Keyword(keywordName: '공부'),
                                SizedBox(width: 6.0),
                                Keyword(keywordName: '디저트'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/icon_direction.png',
                                  fit: BoxFit.contain,
                                  width: 12.0,
                                  height: 12.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0.w),
                                  child: Text(
                                    "30m",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: SvgPicture.asset(
                                    'assets/images/vertical_vector.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: StarRating(
                                    maximumScore: 1,
                                    rating: 4.3,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0.w),
                                  child: Text(
                                    "4.7",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  "(26)",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF868E96),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 18.0,
                      child: Image.asset(
                        'assets/icons/icon_bookmark_fill.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70.0,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                ),
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 70.0,
                  decoration: ShapeDecoration(
                    color: Color(0xffF1F3F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: index != 3
                      ? ClipRRect(
                          //borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            'assets/images/IMG_4498.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 1.0.w,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String limitTextLength(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + "...";
    }
  }
}
