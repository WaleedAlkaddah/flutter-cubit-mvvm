import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:quick_log/quick_log.dart';

class LoginWait extends StatelessWidget {
  final String assetsPath;
  final log = const Logger('LoginWait');

  const LoginWait({
    super.key,
    required this.assetsPath,
  });
  @override
  Widget build(BuildContext context) {
    log.info('Building LoginWait widget...', includeStackTrace: false);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              lottie.Lottie.asset(
                assetsPath,
                width: 412.w,
                height: 412.h,
                fit: BoxFit.contain,
                frameRate: const lottie.FrameRate(144),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
