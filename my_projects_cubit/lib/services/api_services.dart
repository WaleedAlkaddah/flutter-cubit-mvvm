import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';
import '../assetsPath/assets_path.dart';
import 'api_interceptor.dart';

class ApiService {
  final Dio dio = Dio();
  final log = const Logger('ApiService');
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    dio.interceptors.add(LoggingInterceptor());
  }

  Future<Map<String, dynamic>> postApi(
    Map<String, dynamic> dataToSend,
    String endPoint,
  ) async {
    log.info("Start Post API", includeStackTrace: false);
    Map<String, dynamic> requestData = {};
    dataToSend.forEach((key, value) {
      requestData[key] = value;
    });
    Options options = Options(
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    final response = await dio.post('${ApiPath.baseUrl}$endPoint',
        data: requestData, options: options);
    final result = {
      'data': response.data,
      'statusCode': response.statusCode,
    };
    log.info("End Post API With $result", includeStackTrace: false);
    return result;
  }
}
