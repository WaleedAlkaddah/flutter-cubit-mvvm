import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utility/shared_preferences_data.dart';
import '../assetsPath/assets_path.dart';
import '../utility/check_inroductions.dart';
import '../waleedWidget/background_image.dart';
import '../waleedWidget/elevated_button_widget.dart';
import 'introduction_view3.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:google_fonts/google_fonts.dart';

class IntroductionView2 extends StatefulWidget {
  const IntroductionView2({super.key});

  @override
  State<IntroductionView2> createState() => _IntroductoinView2State();
}

class _IntroductoinView2State extends State<IntroductionView2> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  CheckIntroductions checkIntroductions = CheckIntroductions();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    final navigator = Navigator.of(context);
    checkIntroductions.checkPages(
        key: "screenTwoShown",
        nextPage: const IntroductionView3(),
        navigator: navigator);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundImageWidget(
        image: AssetsPath.backgroundLoading,
        child: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              SvgPicture.asset(
                AssetsPath.qareebIcon,
                width: 75.84.r,
                height: 87.12.r,
              ),
              const Spacer(),
              Container(
                width: 412.0.w,
                height: 412.0.h,
                margin: const EdgeInsets.only(top: 80.0, bottom: 176.0).h,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    lottie.Lottie.asset(
                      AssetsPath.location,
                      width: 412.0.w,
                      height: 412.0.h,
                      fit: BoxFit.contain,
                      frameRate: const lottie.FrameRate(144),
                    ),
                    Positioned(
                      top: 380.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(WordsPath.whereWhat,
                              style: GoogleFonts.cairo(
                                fontSize: 17.0.sp,
                                color: const Color(0xFF4CA243),
                              )),
                          20.0.horizontalSpace,
                          Text("/",
                              style: GoogleFonts.cairo(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4CA243),
                              )),
                          20.0.horizontalSpace,
                          Text(
                            WordsPath.wherever,
                            style: GoogleFonts.cairo(
                              fontSize: 17.0.sp,
                              color: const Color(0xFF4CA243),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButtonWidget(
                    name: WordsPath.skip,
                    onPressedCall: () {
                      final currentContext = context;
                      sharedPreferencesData
                          .markIntroductionAsShown('screenTwoShown')
                          .then((_) {
                        Navigator.of(currentContext).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const IntroductionView3()),
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
    );
  }
}
