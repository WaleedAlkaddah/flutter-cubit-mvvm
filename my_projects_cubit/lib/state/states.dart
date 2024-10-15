// The ResendOtpCode State was not set to be treated as Login, and we did that to avoid repetition.
// if need to shared data between states i can use similar of this :
/*
class SharedState {
  String otpCode = "";

  void setOtpCode(String otpCode) {
    this.otpCode = otpCode;
  }

  String getOtpCode() {
    return otpCode;
  }
}
*/
/* ------------------------------------------------------ */
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoadedLoginState extends LoginState {
  final String otpCode;
  LoadedLoginState(this.otpCode);
}

class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {}

/* ------------------------------------------------------ */
abstract class VerifyState {}

class InitialVerifyState extends VerifyState {}

class LoadingVerifyState extends VerifyState {}

class SuccessVerifyState extends VerifyState {}

class FailureVerifyState extends VerifyState {}
