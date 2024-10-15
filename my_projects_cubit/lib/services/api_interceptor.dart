import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';
import '../waleedWidget/snack_bar_widget.dart';

class LoggingInterceptor extends Interceptor {
  final log = const Logger('LoggingInterceptor');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.info("onRequest");
    log.fine('--> ${options.method} ${options.path}');
    log.fine('Headers: ${options.headers}');
    log.fine('Data: ${options.data}');
    log.info("End onRequest");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.info("onResponse");
    log.fine(
        '<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}');
    log.fine('Headers: ${response.headers}');
    log.fine('Response: ${response.data}');
    log.info("End onResponse");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.info("onError");
    if (err.response != null) {
      log.error('API error response:', includeStackTrace: false);
      log.error('Status: ${err.response?.statusCode}',
          includeStackTrace: false);
      log.error('Headers: ${err.response?.headers}', includeStackTrace: false);
      SnackBarWidget.showCustomSnackBar(
          message: "الرجاء إعادة طلب الرمز مرة اخرى", title: "فشل");
    } else {
      log.error('Network error: ${err.message}', includeStackTrace: false);
      SnackBarWidget.showCustomSnackBar(
          message: " فشل الاتصال بالشبكةً", title: "فشل");
    }
    log.info("End onError");
    handler.next(err);
  }
}
