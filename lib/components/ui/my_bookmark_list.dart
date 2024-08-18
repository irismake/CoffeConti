import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/review_button.dart';
import 'keyword.dart';

class MyBookmarkList extends StatelessWidget {
  final String searchText;
  final int index;

  const MyBookmarkList({required this.searchText, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0.h,
          horizontal: 16.0.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          // border: Border.all(
          //   color: Color(0xFFDEE2E6),
          //   width: 0.7,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.0,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
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
            index == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Keyword(keywordName: '공부'),
                            SizedBox(width: 6.0),
                            Keyword(keywordName: '디저트'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '  #레몬스퀘어',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: ReviewButton(),
                      ),
                    ],
                  ),
            // index == 0
            //     ? Container(
            //         width: 70.0,
            //         height: 70.0,
            //         decoration: ShapeDecoration(
            //           color: Color(0xffF1F3F5),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //         ),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(12),
            //           child: Image.asset(
            //             'assets/images/IMG_4498.png',
            //             fit: BoxFit.cover,
            //           ),
            //         ))
            //     : SizedBox.shrink(),
            Text(
              '서울 성북구 안암로 5길 72 (안암동3가)',
              style: TextStyle(
                color: Color(0xff343A40),
                fontSize: 13.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
