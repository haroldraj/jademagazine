import 'package:flutter/material.dart';

class Spacing {
  static SizedBox verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static SizedBox horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  static Size getDeviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
