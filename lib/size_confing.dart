import 'package:flutter/widgets.dart';
import 'dart:math';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? fontSize;
  // static double? blockSizeHorizontal;
  // static double? blockSizeVertical;
  // static double? _safeAreaHorizontal;
  // static double? _safeAreaVertical;
  // static double? safeBlockHorizontal;
  // static double? safeBlockVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    fontSize = _mediaQueryData!.textScaleFactor;

    // blockSizeHorizontal = screenWidth!/100;
    // blockSizeVertical = screenHeight!/100;
    // _safeAreaHorizontal = _mediaQueryData!.padding.left +
    //     _mediaQueryData!.padding.right;
    // _safeAreaVertical = _mediaQueryData!.padding.top +
    //     _mediaQueryData!.padding.bottom;
    // safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!)/100;
    // safeBlockVertical = (screenHeight! - _safeAreaVertical!)/100;
  }
}
class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

