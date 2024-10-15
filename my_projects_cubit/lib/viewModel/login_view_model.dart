import 'package:quick_log/quick_log.dart';
import '../Utility/shared_preferences_data.dart';
import '../model/login_model.dart';
import '../state/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utility/otp_view_utils.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(InitialLoginState());
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('LoginViewModel');
  void login() async {
    emit(LoadingLoginState());
    final model = LoginModel(phoneNumber: "");
    String? phone = await sharedPreferencesData.readShared('Phone');
    final data = await model.requestOTP(phone);
    if (data["progress"] == true) {
      log.fine("LoginViewModel data : $data ", includeStackTrace: false);
      final otp = data["resultOTP"];
      emit(LoadedLoginState(otp));
      OTPViewUtils otpViewUtils = OTPViewUtils(otp);
      otpViewUtils.showCode();
      emit(SuccessLoginState());
    } else {
      log.error("LoginViewModel data : $data", includeStackTrace: false);
      emit(FailureLoginState());
    }
  }
}
