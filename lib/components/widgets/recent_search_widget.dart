import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSearchWidget extends StatelessWidget {
  final VoidCallback onTap;
  RecentSearchWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final List<String> interests = [
    '유어프레소',
    '메시',
    '언덕',
    '강북성북고용복지플러스센터',
    '중앙감속기',
    '봉쥬르',
    '성수동간판없는집',
    '성수노루',
    '금금',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            '최근 검색',
            style: TextStyle(
              fontSize: 16.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: interests.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  //color: Color(0xffF8F9FA),
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        interests[index],
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/button_delete.png',
                          height: 12.0,
                        ),
                        onPressed: () {
                          interests.removeAt(index);
                        },
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                color: Color(0xffF1F3F5),
                height: 1.5.h,
              );
            },
          ),
        ),
      ],
    );
  }
}
