import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_projects_cubit/Utility/shared_preferences_data.dart';
import 'package:quick_log/quick_log.dart';
import '../view/introduction_view1.dart';

class CheckIntroductions {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  late Future<bool> screenShown;
  final log = const Logger('CheckIntroductions');

  void checkPages({
    required String key,
    required Widget nextPage,
    required NavigatorState navigator,
  }) async {
    log.info("Start $key", includeStackTrace: false);
    screenShown = sharedPreferencesData.checkIfIntroductionShown(key);
    if (await screenShown) {
      navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => nextPage),
      );
    }
    log.info("End $key", includeStackTrace: false);
  }

  void firstPage(NavigatorState navigator) async {
    // A condition has been set that it will restart the refresh after the 4 seconds have expired
    if (await screenShown == true) {
      navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => const IntroductionView1()),
      );
    } else {
      Timer(const Duration(seconds: 4), () {
        sharedPreferencesData.markIntroductionAsShown('splashShown');
        navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => const IntroductionView1()),
        );
      });
    }
  }
}
