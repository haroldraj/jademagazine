import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jademagazine/src/constants/helpers.dart';
import 'package:jademagazine/src/views/screens/home/home.view.dart';

class SplashStore extends ChangeNotifier {
  void init(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Helpers.goto(context, HomeView());
    });
  }
}
