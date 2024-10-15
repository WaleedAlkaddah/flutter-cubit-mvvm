import 'package:quick_log/quick_log.dart';
import '../utility/shared_preferences_data.dart';
import '../assetsPath/assets_path.dart';
import '../services/api_services.dart';

class VerifyModel {
  final String phoneNumber;
  final String code;

  VerifyModel({required this.code, required this.phoneNumber});
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('VerifyAndResendModel');

  Future<bool> verify(
      {required String phoneNumber, required String code}) async {
    try {
      final dataToSend = {'phoneNumber': phoneNumber, 'code': code};
      final response =
          await ApiService().postApi(dataToSend, ApiPath.verifyAndLogin);
      if (response['statusCode'] == 200) {
        final verifyAndLoginAccessToken =
            response["data"]["result"]["accessToken"];
        final verifyAndLoginExpireInSeconds =
            response["data"]["result"]["expireInSeconds"].toString();
        await sharedPreferencesData.writeShared(
            dataStore: verifyAndLoginAccessToken,
            dataName: "verifyAndLoginAccessToken");
        await sharedPreferencesData.writeShared(
            dataStore: verifyAndLoginExpireInSeconds,
            dataName: "verifyAndLoginExpireInSeconds");
        log.fine("response model verify : ${response["statusCode"]}");
        return true;
      } else {
        final verifyAndLoginError = response["data"]["error"]["message"];
        await sharedPreferencesData.writeShared(
            dataStore: verifyAndLoginError,
            dataName: "ErrorOnVerifyAndLoginError");
        log.error("Failed to verify Status code: ${response['statusCode']}",
            includeStackTrace: false);
        return false;
      }
    } catch (err) {
      log.error("response model verify : $err", includeStackTrace: false);
      return false;
    }
  }
}
