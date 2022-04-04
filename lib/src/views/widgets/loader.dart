import 'package:flutter/material.dart';
import 'package:jademagazine/src/constants/colors.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(ThemeColor.main),
      )),
    );
  }
}
