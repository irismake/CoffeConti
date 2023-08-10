import 'package:coffeeconti/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/screenSize.dart';
import '../constants/sizes.dart';

class CafeTutorial extends StatelessWidget {
  final cafeName;
  final stringRemainTime;

  CafeTutorial({
    super.key,
    required this.cafeName,
    required this.stringRemainTime,
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
          margin: EdgeInsets.all(screenWidth(context) * 1 / 20),
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
          child: Row(
            children: [
              SizedBox(
                width: screenWidth(context) * 9 / 10 * 3 / 4,
                child: Padding(
                  padding: EdgeInsets.all(Sizes.size24),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 25,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            child: Text(
                              cafeName,
                            ),
                          ),
                        ),
                      ),
                      Gaps.v20,
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 18,

                          //fontFamily: ,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          stringRemainTime,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    print('footprint');
                  },
                  backgroundColor: Colors.grey.shade100,
                  elevation: 0,
                  child: FaIcon(
                    FontAwesomeIcons.shoePrints,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
