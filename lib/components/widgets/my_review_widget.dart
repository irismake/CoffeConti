import 'package:flutter/material.dart';

class MyReviewWidget extends StatelessWidget {
  final int index;
  const MyReviewWidget({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF1F3F5),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/images/image_thumb_${_categoryImages[index]}.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Text(
            '${_categoryNames[index]}',
            style: TextStyle(
              fontFamily: 'PretendardRegular',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
