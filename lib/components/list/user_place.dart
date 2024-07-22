import 'package:flutter/material.dart';

class UserPlace extends StatelessWidget {
  final cafeName;

  UserPlace({
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
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF343A40),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F3F5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 2.0),
                        child: Text(
                          '카페',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 12.0,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F3F5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 2.0),
                        child: Text(
                          '음식점',
                          style: TextStyle(
                            color: Color(0xFF868E96),
                            fontSize: 12.0,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Text(
                    '#뷰  #맛집  #데이트',
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
