import 'package:dio/dio.dart';
import 'dio_intercepter.dart';

class DioClient {
  DioClient() : dio = Dio(
    BaseOptions(
      baseUrl: 'https://direct-service-new.herokuapp.com',
      connectTimeout: 60000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([
    AuthorizationInterceptor(),
    LoggerInterceptor(),
  ]);

  late final Dio dio;

}
class AuthorizationInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    // String? token = await cachedData.getAuthToken();
    // if (token != null && token.isNotEmpty) {
    //   options.headers["Authorization"] = "Bearer $token";
    // }
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }
}