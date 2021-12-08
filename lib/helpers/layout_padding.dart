import 'package:flutter/cupertino.dart';

class CustomPadding {
  double getPadding(double startPadding, double size) {
    if (size > 600 && size <= 900) {
      //tablet
      return startPadding * 2.4;
    } else if (size > 300 && size <= 600) {
      //phone
      return startPadding * 1.2;
    } else {
      //unsupported
      return startPadding;
    }
  }
}
