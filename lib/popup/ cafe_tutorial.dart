import 'package:coffeeconti/constants/gaps.dart';
import 'package:flutter/material.dart';

class CafeTutorial extends StatelessWidget {
  final cafeName;
  const CafeTutorial({super.key, required this.cafeName});

  @override
  Widget build(BuildContext context) {
    print("cafeName : $cafeName");
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: () {
        print('gg');
      },
      child: Padding(
        padding: EdgeInsets.only(top: 550, bottom: 110),
        child: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 0,
                blurRadius: 5.0,
                offset: Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              cafeName.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
