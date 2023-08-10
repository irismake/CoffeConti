import 'package:flutter/widgets.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double bottomNavigationBarHeight(BuildContext context) {
  return 70.0;
}

double cafeTutorialTopPosition(BuildContext context) {
  return MediaQuery.of(context).size.height * 4 / 6;
}

double cafeTutorialBottomPosition(BuildContext context) {
  return bottomNavigationBarHeight(context);
}

double UnfocusCurrentPosition(BuildContext context) {
  return 20;
}

double FocusCurrentPosition(BuildContext context) {
  return screenHeight(context) -
      cafeTutorialTopPosition(context) -
      cafeTutorialBottomPosition(context);
}
