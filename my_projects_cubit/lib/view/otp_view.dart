import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_projects_cubit/utility/otp_view_utils.dart';
import 'package:my_projects_cubit/view/login.dart';
import 'package:pinput/pinput.dart';
import 'package:quick_log/quick_log.dart';
import '../state/states.dart';
import '../utility/shared_preferences_data.dart';
import '../assetsPath/assets_path.dart';
import '../viewModel/login_view_model.dart';
import '../viewModel/verify_view_model.dart';
import '../waleedWidget/elevated_button_widget.dart';
import 'home.dart';
import 'login_wait.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('OTPView');
  String phone = "";

  Future<void> loadData() async {
    String data = await sharedPreferencesData.readShared("Phone");
    setState(() {
      phone = data;
    });
  }

  @override
  void initState() {
    super.initState();
    OTPViewUtils.otpController.text = "";
    loadData();
    // The SnackBarWidget is called in LoginViewModel
  }

  @override
  Widget build(BuildContext context) {
    final verifyViewModel = context.read<VerifyViewModel>();
    final loginViewModel = context.read<LoginViewModel>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            AssetsPath.qareebAppBar,
            width: 139.32.w,
            height: 30.78.h,
          ),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<VerifyViewModel, VerifyState>(
                listener: (context, state) {
              log.info('State change for VerifyState: $state',
                  includeStackTrace: false);
              if (state is LoadingVerifyState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginWait(
                        assetsPath: AssetsPath.done,
                      ),
                    ));
              } else if (state is FailureVerifyState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTPView()),
                );
              } else if (state is SuccessVerifyState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ));
              }
            }),
            BlocListener<LoginViewModel, LoginState>(
                listener: (context, state) {
              log.info('State change for LoginState in OTP_View: $state',
                  includeStackTrace: false);
              if (state is LoadingLoginState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginWait(
                        assetsPath: AssetsPath.done,
                      ),
                    ));
              } else if (state is SuccessLoginState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTPView()),
                );
              } else if (state is FailureLoginState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTPView()),
                );
              }
            })
          ],
          child: Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 31.0).w,
                  width: 1.0.sw,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(10.0).r,
                  ),
                  child: Column(
                    children: [
                      10.0.verticalSpace,
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          WordsPath.confirmTheNumber,
                          style: GoogleFonts.cairo(
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4CA243),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(right: 25.0, bottom: 9.0)
                                    .w,
                            child: Text(
                              WordsPath.sendConformation,
                              style: GoogleFonts.cairo(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF848484),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 17.0).w.h,
                            child: Text(
                              "+$phone",
                              style: GoogleFonts.cairo(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF848484),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 295.w,
                        height: 50.h,
                        margin: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 26.0)
                            .h
                            .w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFDFDFDFF),
                        ),
                        child: Pinput(
                          length: 6,
                          controller: OTPViewUtils.otpController,
                          submittedPinTheme: const PinTheme(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          defaultPinTheme: const PinTheme(),
                          keyboardType: TextInputType.number,
                          separator: Container(
                            width: 2,
                            height: 29,
                            color: const Color(0x0fd9d9d9),
                          ),
                          onCompleted: (pin) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27.0).w,
                        child: ElevatedButtonWidget(
                          name: WordsPath.verify,
                          elevatedWidth: 296.0,
                          elevatedHeight: 48.0,
                          fontSize: 12.0,
                          onPressedCall: () {
                            verifyViewModel.verify();
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14.0).h,
                        child: InkWell(
                          onTap: () {
                            loginViewModel.login();
                          },
                          child: Text(
                            WordsPath.resendOTP,
                            style: GoogleFonts.cairo(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF848484),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
