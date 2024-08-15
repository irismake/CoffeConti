import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'keyword.dart';

class ListPlaceTutorial extends StatelessWidget {
  final String name;
  final int index;
  const ListPlaceTutorial({
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${name}',
                style: TextStyle(
                  color: Color(0xFF343A40),
                  fontSize: 16.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: Row(
                  children: [
                    Keyword(keywordName: '공부'),
                    SizedBox(width: 6.0),
                    Keyword(keywordName: '디저트'),
                  ],
                ),
              ),
              Text(
                '#레몬스퀘어  #편한의자  #큰테이블',
                style: TextStyle(
                  color: Color(0xFF868E96),
                  fontSize: 12.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              index == 0
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset(
                          'assets/images/IMG_4498.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 12.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/icon_direction.png',
                    fit: BoxFit.contain,
                    width: 12.0,
                    height: 12.0,
                    color: Color(0xFF868E96),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    child: Text(
                      "30m",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF868E96),
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
                    child: Image.asset(
                      'assets/icons/icon_star.png',
                      color: Color(0xFF868E96),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    child: Text(
                      "4.7",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF868E96),
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
            ],
          ),
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
