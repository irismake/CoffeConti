import 'package:flutter/widgets.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double ViewPaddingTopSize(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double ViewPaddingBottomSize(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double bottomNavigationBarHeight(BuildContext context) {
  return 70.0;
}

double cafeTutorialTopPosition(BuildContext context) {
  return MediaQuery.of(context).size.height * 3 / 5;
}

double cafeTutorialBottomPosition(BuildContext context) {
  return bottomNavigationBarHeight(context) + ViewPaddingBottomSize(context);
}

double UnfocusCurrentPosition(BuildContext context) {
  return 20;
}

double CafeTutorialMarginSize(BuildContext context) {
  return 20.0;
}

double FocusCurrentPosition(BuildContext context) {
  return screenHeight(context) -
      ViewPaddingTopSize(context) -
      ViewPaddingBottomSize(context) -
      cafeTutorialTopPosition(context) -
      cafeTutorialBottomPosition(context) +
      CafeTutorialMarginSize(context);
}
