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

double ModalBottomSheetHeight(BuildContext context) {
  return screenHeight(context) * 3 / 4;
}

double bottomNavigationBarHeight(BuildContext context) {
  return 80.0;
}

double cafeTutorialHeight(BuildContext context) {
  return 200.0;
}

double cafeTutorialTopPosition(BuildContext context) {
  return MediaQuery.of(context).size.height -
      ViewPaddingBottomSize(context) -
      bottomNavigationBarHeight(context) -
      cafeTutorialHeight(context);
}

double cafeTutorialBottomPosition(BuildContext context) {
  return bottomNavigationBarHeight(context) +
      ViewPaddingBottomSize(context) +
      10;
}

double UnfocusCurrentPosition(BuildContext context) {
  return 20;
}

double CafeTutorialMarginSize(BuildContext context) {
  return 20.0;
}

double FocusCurrentPosition(BuildContext context) {
  return cafeTutorialHeight(context);
}
  // return screenHeight(context) -
  //     ViewPaddingTopSize(context) -
  //     ViewPaddingBottomSize(context) -
  //     cafeTutorialTopPosition(context) -
  //     cafeTutorialBottomPosition(context) +
  //     CafeTutorialMarginSize(context);
