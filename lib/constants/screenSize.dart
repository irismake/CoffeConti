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
  return MediaQuery.of(context).size.height * 3 / 5;
}

double cafeTutorialBottomPosition(BuildContext context) {
  return bottomNavigationBarHeight(context);
}

double UnfocusCurrentPosition(BuildContext context) {
  return 20;
}

EdgeInsets ViewPaddingSize(BuildContext context) {
  return MediaQuery.of(context).viewPadding;
}

double CafeTutorialMarginSize(BuildContext context) {
  return 20.0;
}

double FocusCurrentPosition(BuildContext context) {
  EdgeInsets viewPadding = ViewPaddingSize(context);

  double top = viewPadding.top;
  double bottom = viewPadding.bottom;

  return screenHeight(context) -
      top -
      bottom -
      cafeTutorialTopPosition(context) -
      cafeTutorialBottomPosition(context);
}
