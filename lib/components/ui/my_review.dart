import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'keyword.dart';
import 'star_rating.dart';

class MyReview extends StatelessWidget {
  final String searchText;
  final int index;

  const MyReview({required this.searchText, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$searchText',
              style: TextStyle(
                color: Color(0xFF343A40),
                fontSize: 16.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  //color: Color(0xFF343A40).withOpacity(0.8),
                  height: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: StarRating(
                      maximumScore: 5,
                      rating: 4.3,
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
                Text(
                  '2024.08.06',
                  style: TextStyle(
                    color: Color(0xFF868E96),
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
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
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        'assets/images/IMG_4498.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
