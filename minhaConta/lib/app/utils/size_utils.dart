import 'package:flutter/material.dart';

class SizeUtils {
  static MediaQueryData _mediaQuery;
  static double widthScreen;
  static double heigthScreen;
  static double statusBarHeigth;

  static init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    widthScreen = _mediaQuery.size.width;
    heigthScreen = _mediaQuery.size.height;
    statusBarHeigth = _mediaQuery.padding.top;
  }
}
