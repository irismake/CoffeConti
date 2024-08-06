import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchKeywordButton extends StatelessWidget {
  final int keywordId;
  final String name;

  SearchKeywordButton({
    super.key,
    required this.keywordId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.0.w,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              width: 1.0,
              color: Color(0xFFDEE2E6),
            ),
          ),
          minimumSize: Size.zero,
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
          ),
          backgroundColor: Color(0xFF3D3332),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontFamily: 'PretendardRegular',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
                height: 1.43,
              ),
            ),
            SizedBox(
              width: 6.0.w,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 10,
                width: 10,
                padding: EdgeInsets.zero,
                child: Image.asset(
                  'assets/icons/button_delete.png',
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
