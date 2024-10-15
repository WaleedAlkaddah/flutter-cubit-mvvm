import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utility/shared_preferences_data.dart';
import '../assetsPath/assets_path.dart';
import '../utility/check_inroductions.dart';
import '../waleedWidget/background_image.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:flutter/services.dart';

import 'introduction_view1.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  CheckIntroductions checkIntroductions = CheckIntroductions();
  @override
  void initState() {
    final navigator = Navigator.of(context);
    checkIntroductions.checkPages(
      key: "splashShown",
      nextPage: const IntroductionView1(),
      navigator: navigator,
    );
    checkIntroductions.firstPage(navigator);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BackgroundImageWidget(
          image: AssetsPath.backgroundLoading,
          child: Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                SvgPicture.asset(
                  AssetsPath.qareebLogo,
                  width: 297.83.r,
                  height: 251.56.r,
                ),
                const Spacer(),
                lottie.Lottie.asset(
                  AssetsPath.loadingAnimation,
                  width: 298.r,
                  height: 168.r,
                ),
              ],
            ),
          ),
        ));
  }
}
