import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'keyword.dart';

class MyGroups extends StatelessWidget {
  final cafeName;

  MyGroups({
    super.key,
    required this.cafeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
      child: GestureDetector(
        // behavior: HitTestBehavior.opaque,
        onTap: () {
          print('gg');
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.0,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  limitTextLength(cafeName, 15),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0.sp,
                    height: 1.56,
                  ),
                ),
                Row(
                  children: [
                    Keyword(keywordName: '공부'),
                    SizedBox(width: 6.0),
                    Keyword(keywordName: '디저트'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Text(
                    '(9/500)',
                    style: TextStyle(
                      fontFamily: 'PretendardRegular',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFADB5BD),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
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
