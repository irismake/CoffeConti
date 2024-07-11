import 'package:coffeeconti/components/constants/gaps.dart';
import 'package:coffeeconti/data/cafe_data.dart';
import 'package:coffeeconti/widgets/tabs/map_tab/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/constants/screenSize.dart';
import '../components/constants/sizes.dart';

class CafeTutorial extends StatelessWidget {
  final cafeName;
  final stringRemainTime;
  final tappedMarkerPosition;
  final currentPosition;

  CafeTutorial({
    super.key,
    required this.cafeName,
    required this.stringRemainTime,
    required this.tappedMarkerPosition,
    required this.currentPosition,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: () {
        print('gg');
      },

      child: Padding(
        padding: EdgeInsets.only(
          top: cafeTutorialTopPosition(context),
          bottom: cafeTutorialBottomPosition(context),
        ),
        child: Container(
          margin: EdgeInsets.all(
            CafeTutorialMarginSize(context),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  // width: 110,
                  color: Colors.grey[200],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 25,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 30,
                        // color: Colors.amber,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            child: Text(
                              limitTextLength(cafeName, 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 20),
                          SizedBox(width: 5),
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 15,
                              //fontFamily: ,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            child: Text(
                              stringRemainTime,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 15,
                              //fontFamily: ,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            child: Text(
                              "30m",
                            ),
                          ),
                        ],
                      ),
                    ],
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
