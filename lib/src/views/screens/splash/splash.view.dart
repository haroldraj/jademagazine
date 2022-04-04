import 'package:flutter/material.dart';
import 'package:jademagazine/src/constants/spacing.dart';
import 'package:jademagazine/src/views/screens/splash/splash.store.dart';
import 'package:jademagazine/src/views/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashStore>.reactive(
        onModelReady: (store) => store.init(context),
        builder: (context, model, _) => Scaffold(
              body: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("images/logo.png"),
                      Spacing.verticalSpace(16),
                      Loader()
                    ],
                  )),
            ),
        viewModelBuilder: () => SplashStore());
  }
}
