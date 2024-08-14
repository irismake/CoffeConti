import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui/keyword.dart';
import '../ui/star_rating.dart';

class PlaceTutorial extends StatelessWidget {
  final String name;

  PlaceTutorial({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/IMG_4498.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          limitTextLength(name, 8),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Keyword(keywordName: '공부'),
                              SizedBox(width: 6.0),
                              Keyword(keywordName: '디저트'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/icon_direction.png',
                                fit: BoxFit.contain,
                                width: 12.0,
                                height: 12.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.0.w),
                                child: Text(
                                  "30m",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: SvgPicture.asset(
                                  'assets/images/vertical_vector.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: StarRating(
                                  maximumScore: 1,
                                  rating: 4.3,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.0.w),
                                child: Text(
                                  "4.7",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              Text(
                                "(26)",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF868E96),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.2, right: 7.53),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    // color: Colors.pink,
                    height: 18.0,
                    child: Image.asset(
                      'assets/icons/icon_bookmark_fill.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
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
