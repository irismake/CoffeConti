import 'package:coffeeconti/screen/map/search_place_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPlaceButton extends StatelessWidget {
  final String currentAddress;

  const SearchPlaceButton({
    required this.currentAddress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPlacePage(),
            ),
          );
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 14.0.w),
          backgroundColor: Colors.white,
          side: BorderSide(
            // 테두리 추가
            color: Color(0xFFDEE2E6), // 테두리 색상
            width: 1.0, // 테두리 두께
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currentAddress,
              style: TextStyle(
                fontFamily: 'PretendardRegular',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF343A40),
                height: 1.5,
              ),
            ),
            Image.asset(
              'assets/icons/icon_arrow_right.png',
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
