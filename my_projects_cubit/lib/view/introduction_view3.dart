import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utility/shared_preferences_data.dart';
import '../assetsPath/assets_path.dart';
import '../utility/check_inroductions.dart';
import '../waleedWidget/background_image.dart';
import '../waleedWidget/elevated_button_widget.dart';
import 'introduction_signup_login.dart';

class IntroductionView3 extends StatefulWidget {
  const IntroductionView3({super.key});

  @override
  State<IntroductionView3> createState() => _IntroductoinView3State();
}

class _IntroductoinView3State extends State<IntroductionView3> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  CheckIntroductions checkIntroductions = CheckIntroductions();

  @override
  void initState() {
    final navigator = Navigator.of(context);
    checkIntroductions.checkPages(
        key: "screenThirdShown",
        nextPage: const IntroductionSignUpLogin(),
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
              const Spacer(),
              Column(
                children: [
                  SvgPicture.asset(
                    AssetsPath.qareebLogo1,
                    width: 86.35.r,
                    height: 137.1.r,
                  ),
                  10.0.verticalSpace,
                  Text(WordsPath.waiting,
                      style: GoogleFonts.cairo(
                        fontSize: 20.0.sp,
                        color: const Color(0xFF4CA243),
                      )),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButtonWidget(
                    name: WordsPath.next,
                    onPressedCall: () async {
                      final currentContext = context;
                      sharedPreferencesData
                          .markIntroductionAsShown('screenThirdShown')
                          .then((_) {
                        Navigator.of(currentContext).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const IntroductionSignUpLogin()),
                        );
                      });
                    },
                    elevatedWidth: 83.0,
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
