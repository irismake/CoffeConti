import 'package:coffeeconti/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/screenSize.dart';
import '../constants/sizes.dart';

class NoCafeToast extends StatelessWidget {
  NoCafeToast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: screenWidth(context) * 3 / 4,
        height: screenHeight(context) * 1 / 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 0,
              blurRadius: 5.0,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
