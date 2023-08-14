import 'package:coffeeconti/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoCafeToast extends StatelessWidget {
  NoCafeToast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(15),
          width: 250,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 0,
                blurRadius: 9.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                FontAwesomeIcons.faceSadTear,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              Gaps.v10,
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
                child: const Text(
                  "주변에 이용가능한 카페가 없습니다.",
                ),
              ),
            ],
          )),
    );
  }
}
