import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../assetsPath/assets_path.dart';
import '../waleedWidget/background_image.dart';
import '../waleedWidget/elevated_button_widget.dart';
import 'login.dart';

class IntroductionLogin extends StatefulWidget {
  const IntroductionLogin({super.key});

  @override
  State<IntroductionLogin> createState() => _IntroductionLoginState();
}

class _IntroductionLoginState extends State<IntroductionLogin> {
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 53.0).w,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AssetsPath.qareebLogo,
                      width: 199.91.r,
                      height: 168.86.r,
                    ),
                    5.0.verticalSpace,
                    Container(
                      margin: const EdgeInsets.only(top: 10.0).h,
                      child: ElevatedButtonWidget(
                        name: WordsPath.login,
                        elevatedWidth: 295.0,
                        elevatedHeight: 53.0,
                        fontSize: 12.0,
                        onPressedCall: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0).h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      WordsPath.termsAndPrivacy,
                      style: GoogleFonts.cairo(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF008543),
                      ),
                    ),
                    Text(
                      WordsPath.continuation,
                      style: GoogleFonts.cairo(
                        fontSize: 12.0.sp,
                        color: const Color(0xFF008543),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
