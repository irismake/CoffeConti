import 'package:coffeeconti/constants/gaps.dart';
import 'package:flutter/material.dart';

class CafeTutorial extends StatelessWidget {
  const CafeTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: () {
        print('gg');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: AlertDialog(
          alignment: Alignment.bottomCenter,
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          content: Container(
            color: Colors.deepOrange,
            width: 700,
            height: 150,
          ),
        ),
      ),
    );
  }
}
