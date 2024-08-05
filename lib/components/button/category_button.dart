import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../popup/show_category_sheet.dart';

class CategoryButton extends StatelessWidget {
  final int? index;
  const CategoryButton({
    super.key,
    required this.index,
  });

  void _tapCategory(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ShowCategorySheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> _categoryImages = [
      'cafe',
      'restaurant',
      'convenience_store',
      'movie',
      'parking',
      'hospital'
    ];
    List<String> _categoryNames = [
      '카페',
      '음식점',
      '편의점',
      '영화관',
      '주차장',
      '병원',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0.w,
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: ElevatedButton(
          onPressed: () {
            _tapCategory(context);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                width: 0.7,
                color: Color(0xFF343A40),
              ),
            ),
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 18,
                child: Image.asset(
                  index != null
                      ? 'assets/images/image_thumb_${_categoryImages[index!]}.png'
                      : 'assets/icons/button_more.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                index != null ? '${_categoryNames[index!]}' : '카테고리',
                style: TextStyle(
                  fontFamily: 'PretendardRegular',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF343A40),
                  height: 1.43,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
