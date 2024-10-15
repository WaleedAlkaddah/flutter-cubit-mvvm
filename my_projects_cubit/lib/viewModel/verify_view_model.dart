import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_log/quick_log.dart';
import '../utility/otp_view_utils.dart';
import '../utility/shared_preferences_data.dart';
import '../model/verify_model.dart';
import '../state/states.dart';

class VerifyViewModel extends Cubit<VerifyState> {
  VerifyViewModel() : super(InitialVerifyState());
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final TextEditingController otpController = TextEditingController();
  final log = const Logger('VerifyAndResendViewModel');

  void verify() async {
    emit(LoadingVerifyState());
    log.info("Verify Start", includeStackTrace: false);
    final model = VerifyModel(phoneNumber: "", code: "");
    String? phone = await sharedPreferencesData.readShared("Phone");
    final verify = await model.verify(
        phoneNumber: phone, code: OTPViewUtils.otpController.text);

    if (verify) {
      log.fine("Verify True", includeStackTrace: false);
      emit(SuccessVerifyState());
    } else {
      log.error("Verify False", includeStackTrace: false);
      emit(FailureVerifyState());
    }
  }
}
