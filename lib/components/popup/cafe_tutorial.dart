import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui/keyword.dart';
import '../ui/star_rating.dart';

class CafeTutorial extends StatelessWidget {
  final int index;
  final String name;

  CafeTutorial({
    super.key,
    required this.index,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('gg');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 18.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: ShapeDecoration(
                      color: Color(0xffF1F3F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: index == 0
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/IMG_4498.png',
                              fit: BoxFit.cover,
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      limitTextLength(name, 15),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "4.3",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                            height: 1.3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          child: SizedBox(
                            height: 16.w,
                            child: StarRating(
                              maximumScore: 5,
                              rating: 4.3,
                            ),
                          ),
                        ),
                        Text(
                          "(26)",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff868E96),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Keyword(keywordName: '공부'),
                          SizedBox(width: 6.0),
                          Keyword(keywordName: '디저트'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "30m",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
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
                        Text(
                          "서울 성북구 안암동 3가",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF495057),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              // color: Colors.pink,
              height: 18.0,
              child: Image.asset(
                'assets/icons/icon_bookmark_fill.png',
                fit: BoxFit.contain,
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
