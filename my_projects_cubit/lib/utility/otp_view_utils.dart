import 'package:flutter/cupertino.dart';
import '../utility/shared_preferences_data.dart';
import 'package:quick_log/quick_log.dart';
import '../waleedWidget/snack_bar_widget.dart';

class OTPViewUtils {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  static final TextEditingController otpController = TextEditingController();
  final log = const Logger('OTPViewUtils');
  final String otpCode;
  String phone = "";
  OTPViewUtils(this.otpCode);

  void showCode() async {
    log.fine(otpCode, includeStackTrace: false);
    SnackBarWidget.showCustomSnackBar(
        message: " قم بإدخال الرقم التالي : $otpCode", title: "التحقق");
  }
}
