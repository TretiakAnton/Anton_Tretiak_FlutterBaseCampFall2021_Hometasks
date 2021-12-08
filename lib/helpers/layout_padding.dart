class CustomPadding {
  double getPadding(double startPadding, int size) {
    double result;
    if (size > 600 && size <= 900) {
      //tablet
      result = startPadding * 2.4;
    } else if (size > 300 && size <= 600) {
      //phone
      result = startPadding * 1.2;
    } else {
      //unsupported
      result = startPadding;
    }
    return result;
  }
}
