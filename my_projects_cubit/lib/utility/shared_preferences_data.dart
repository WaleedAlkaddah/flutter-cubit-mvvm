import 'package:my_projects_cubit/utility/login_view_utils.dart';
import 'package:quick_log/quick_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  final log = const Logger('SharedPreferencesData');

  Future<bool> writeShared(
      {required String dataStore, required String dataName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (dataStore.isEmpty) {
      log.error("DataStore isEmpty", includeStackTrace: false);
      return false;
    } else {
      prefs.setString(dataName, dataStore);
      log.fine("SharedPreferencesData writeShared  $dataName : $dataStore",
          includeStackTrace: false);
      return true;
    }
  }

  Future<String> readShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    if (stringValue == null) {
      log.error("No readShared Found with key : $key !!",
          includeStackTrace: false);
      return "";
    }
    log.info("SharedPreferencesData readShared $key : $stringValue",
        includeStackTrace: false);
    return stringValue;
  }

  Future<bool> deleteFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      await prefs.remove(key);
      log.fine("Key '$key' and its corresponding value deleted successfully.",
          includeStackTrace: false);
      return true;
    } else {
      log.error("Key '$key' not found in SharedPreferences.",
          includeStackTrace: false);
      return false;
    }
  }

  Future<bool> markIntroductionAsShown(String dataName) async {
    log.warning("Start OnPressed $dataName", includeStackTrace: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(dataName, true);
    log.fine("SharedPreferencesData markIntroductionAsShown  $dataName : true",
        includeStackTrace: false);
    log.warning("End OnPressed $dataName", includeStackTrace: false);
    return true;
  }

  Future<bool> checkIfIntroductionShown(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getBool(key) ?? false;
    log.info("SharedPreferencesData checkIfIntroductionShown $key : $data",
        includeStackTrace: false);
    return data;
  }

  void initializeSharedPreferences() async {
    String? phone = await readShared('Phone');
    LoginViewUtils.phoneNumberLoginController.text = phone;
  }
}
