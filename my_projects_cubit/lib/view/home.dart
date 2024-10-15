import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:unicons/unicons.dart';
import '../assetsPath/assets_path.dart';
import '../waleedWidget/background_image.dart';
import '../waleedWidget/elevated_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: SizedBox(
        width: 1.0.sw,
        height: 1.0.sh,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: SvgPicture.asset(
                  AssetsPath.qareebAppBar,
                  width: 139.32.r,
                  height: 30.78.r,
                ),
              ),
              body: BackgroundImageWidget(
                image: AssetsPath.backgroundHome,
                widthImage: 412.0.w,
                heightImage: 570.0.h,
              ),
            ),
            Positioned(
              width: 412.0.r,
              height: 412.0.r,
              top: 250.0.h,
              child: lottie.Lottie.asset(
                AssetsPath.location,
                fit: BoxFit.contain,
                frameRate: const lottie.FrameRate(144),
              ),
            ),
            Positioned(
              top: 675.0.h,
              child: ElevatedButtonWidget(
                name: WordsPath.welcomeQareeb,
                elevatedWidth: 313.0,
                elevatedHeight: 48.0,
                fontSize: 12.0,
                elevatedBorderRadius: BorderRadius.circular(0.0).r,
              ),
            ),
            Positioned(
              top: 800.0.h,
              child: SizedBox(
                width: 40.0.w,
                height: 40.0.w,
                child: Icon(
                  UniconsLine.bars,
                  color: const Color(0xff4CA243),
                  size: 33.0.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
