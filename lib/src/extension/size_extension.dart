import 'dart:math';
import 'package:flutter/material.dart';

extension SizerExt on num {
  static final _screenSizes = ScreenSizes();

  ///* Get the `width` by percentage of screen width `10.w`
  double get w => _screenSizes.getWidth(this);

  ///* Get the `height` by percentage of screen height `10.h`
  double get h => _screenSizes.getHeight(this);

  ///* Get the `relative width` by pixels of screen width
  double get rw => _screenSizes.getRelativeWidth(this);

  ///* Get the `relative height` by pixels of screen height
  double get rh => _screenSizes.getRelativeHeight(this);

  ///* Get the responsive `size` for fonts and spacing based on the scale and screen size
  double get rSp => _screenSizes.getRelativeSize(this);
}

class ScreenSizes {
  static final ScreenSizes _screenSizes = ScreenSizes._();
  ScreenSizes._();
  factory ScreenSizes() => _screenSizes;
  final Size _designSize = const Size(375, 812);
  static double screenWidth = 375;
  static double screenHeight = 812;

  ///* initialize the size
  static init(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  Size get designSize => _designSize;

  double get scaleWidth => screenWidth / designSize.width;
  double get scaleHeight => screenHeight / designSize.height;

  double getRelativeWidth(num size) => size * scaleWidth;
  double getRelativeHeight(num size) => size * scaleHeight;
  double getRelativeSize(num size) => size * min(scaleWidth, scaleHeight);

  double getWidth(num size) => size * screenWidth / 100;
  double getHeight(num size) => size * screenHeight / 100;
}
