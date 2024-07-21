import 'package:flutter/material.dart';

class CategoryThumb extends StatelessWidget {
  final int index;
  const CategoryThumb({
    super.key,
    required this.index,
  });

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
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: 110.0,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 0.5,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
                width: 75,
                child: Image.asset(
                  'assets/images/image_thumb_${_categoryImages[index]}.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                '${_categoryNames[index]}',
                style: TextStyle(
                  fontFamily: 'PretendardRegular',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff868E96),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
