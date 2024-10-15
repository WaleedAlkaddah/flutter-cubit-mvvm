import 'package:quick_log/quick_log.dart';
import '../utility/shared_preferences_data.dart';
import '../assetsPath/assets_path.dart';
import '../services/api_services.dart';

class LoginModel {
  final String phoneNumber;
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  LoginModel({required this.phoneNumber});
  final log = const Logger('LoginModel');

  Future<Map<String, dynamic>> requestOTP(String phoneNumber) async {
    try {
      final dataToSend = {
        'phoneNumber': phoneNumber,
      };
      final response =
          await ApiService().postApi(dataToSend, ApiPath.requestOTP);
      if (response['statusCode'] == 200) {
        log.fine("response model requestOTP : ${response["statusCode"]}");

        final resultOTP = response['data']["result"];
        final result = {'resultOTP': resultOTP, 'progress': true};
        return result;
      } else {
        final resultOtpError = response["data"]["error"]["message"];
        await sharedPreferencesData.writeShared(
            dataStore: resultOtpError, dataName: "ErrorOnLogin");
        log.error(
            "Failed to request OTP. Status code: ${response['statusCode']}",
            includeStackTrace: false);
        final result = {'progress': false};
        return result;
      }
    } catch (e) {
      log.error("response model requestOTP : $e", includeStackTrace: false);
      final result = {'progress': false};
      return result;
    }
  }
}
