import 'package:crendly/data/local/local_storage.dart';
import 'package:dio/dio.dart';
import 'dio_error.dart';
import 'dio_intercepter.dart';
import 'package:get/get.dart' as di;

class NetworkProvider{

  Dio _getDioInstance(){
    var dio = Dio(BaseOptions(
        baseUrl: "https://crendly-apim.azure-api.net",
        connectTimeout:60000,
        receiveTimeout:60000
    ));
    dio.interceptors.add(LoggerInterceptor());
    dio.interceptors.add(AuthorizationInterceptor());
    dio.interceptors.add(LogInterceptor(responseBody: true,error: true,request: true,requestBody: true));
    return dio;
  }

  Future<Response?> call(
      {
        required String path,
        required  RequestMethod method,
        dynamic body=const {},
        Map<String,dynamic> queryParams=const {}
      })async{
    Response? response;
    try{
      switch(method){
        case RequestMethod.get:
          response = await _getDioInstance().get(path, queryParameters: queryParams);
          break;
        case RequestMethod.post:
          response = await _getDioInstance()
              .post(path, data: body, queryParameters: queryParams);
          break;
        case RequestMethod.patch:
          response = await _getDioInstance()
              .patch(path, data: body, queryParameters: queryParams);
          break;
        case RequestMethod.put:
          response = await _getDioInstance()
              .put(path, data: body, queryParameters: queryParams);
          break;
        case RequestMethod.delete:
          response = await _getDioInstance()
              .delete(path, data: body, queryParameters: queryParams);
          break;
      }
      return response;
    }on DioError catch (error) {
      return Future.error(ApiError.fromDio(error));
    }
  }
}


class AuthorizationInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    di.Get.put<LocalCachedData>(await LocalCachedData.create());
    String? token = await LocalCachedData.instance.getAuthToken();
    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    options.headers["Ocp-Apim-Subscription-Key"] = "f75e4d5543e443af8a7a62b2a87465f7";
    super.onRequest(options, handler);
  }
}

enum RequestMethod { get, post, put, patch, delete }