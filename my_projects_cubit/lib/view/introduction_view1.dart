import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utility/shared_preferences_data.dart';
import '../utility/check_inroductions.dart';
import '../waleedWidget/background_image.dart';
import '../assetsPath/assets_path.dart';
import '../waleedWidget/elevated_button_widget.dart';
import 'package:lottie/lottie.dart' as lottie;

import 'introduction_view2.dart';

class IntroductionView1 extends StatefulWidget {
  const IntroductionView1({super.key});

  @override
  State<IntroductionView1> createState() => _IntroductionView1State();
}

class _IntroductionView1State extends State<IntroductionView1> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  CheckIntroductions checkIntroductions = CheckIntroductions();

  @override
  void initState() {
    final navigator = Navigator.of(context);
    checkIntroductions.checkPages(
      key: "screenOneShown",
      nextPage: const IntroductionView2(),
      navigator: navigator,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImageWidget(
          image: AssetsPath.backgroundLoading,
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  AssetsPath.qareebIcon,
                  width: 75.84.r,
                  height: 87.12.r,
                ),
                lottie.Lottie.asset(
                  AssetsPath.hi,
                  width: 550.0.w,
                  height: 500.0.h,
                  fit: BoxFit.fitWidth,
                  frameRate: const lottie.FrameRate(144),
                ),
                const Spacer(
                  flex: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButtonWidget(
                      name: WordsPath.skip,
                      onPressedCall: () {
                        final currentContext = context;
                        sharedPreferencesData
                            .markIntroductionAsShown('screenOneShown')
                            .then((_) {
                          Navigator.of(currentContext).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const IntroductionView2()),
                          );
                        });
                      },
                      elevatedWidth: 85.0,
                      elevatedHeight: 38.0,
                      fontSize: 12.0,
                    ),
                    13.0.horizontalSpace,
                  ],
                ),
                10.0.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
