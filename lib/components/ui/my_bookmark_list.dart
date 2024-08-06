import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'keyword.dart';

class MyBookmarkList extends StatelessWidget {
  final String searchText;
  final int index;

  const MyBookmarkList({required this.searchText, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        SizedBox(
          height: 120.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$searchText',
                  style: TextStyle(
                    color: Color(0xFF343A40),
                    fontSize: 18.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                index == 0
                    ? Expanded(
                        child: Padding(
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
                        ),
                      )
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF343A40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.h, horizontal: 6.0.w),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  '리뷰 작성',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12.0.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
        ),
      ],
    );
  }
}
