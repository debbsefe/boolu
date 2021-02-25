import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

// ignore: non_constant_identifier_names
SizedBox Height(double height) {
  return SizedBox(height: height);
}

// ignore: non_constant_identifier_names
SizedBox Width(double width) {
  return SizedBox(width: width);
}

// ignore: non_constant_identifier_names
Widget CustomVerticalDivider() {
  return Container(
    color: Colors.grey[200],
    height: 4.0.h,
    width: 0.5.w,
    child: VerticalDivider(),
  );
}
