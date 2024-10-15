import 'package:flutter/material.dart';
import 'package:my_projects_cubit/Utility/shared_preferences_data.dart';
import 'package:quick_log/quick_log.dart';

class LoginViewUtils {
  static final TextEditingController phoneNumberLoginController =
      TextEditingController();
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('ViewUtils');
  bool isChecked = false;

  void checkRemember(bool value) {
    isChecked = value;
    String? phone = phoneNumberLoginController.text;
    if (isChecked == true) {
      sharedPreferencesData.writeShared(dataStore: phone, dataName: "Phone");
      log.fine("isChecked : $isChecked", includeStackTrace: false);
    } else {
      log.error("isChecked :$isChecked", includeStackTrace: false);
    }
  }
}
