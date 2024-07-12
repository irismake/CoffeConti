import 'package:coffeeconti/widgets/tabs/map_tab/search_screen.dart';
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
              builder: (context) => SearchScreen(),
            ),
          );
        },
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 14.0.w),
            backgroundColor: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currentAddress,
              style: TextStyle(
                fontFamily: 'PretendardRegular',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
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
