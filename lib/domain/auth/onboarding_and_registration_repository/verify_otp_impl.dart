import 'package:crendly/app/constants/http_status.dart';
import 'package:crendly/app/constants/strings.dart';
import 'package:crendly/data/model/auth/verify_otp_response_model.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/use_cases/use_cases.dart';


class VerifyOtpImpl implements useCase<DataState<VerifyOtpResponseModel>, VerifyOtpParam> {
  final AuthRepository _authRepository;

  VerifyOtpImpl(this._authRepository);

  @override
  Future<DataState<VerifyOtpResponseModel>> execute({required VerifyOtpParam params}) async{
    try {
      final response = await _authRepository.verifyOtp(otp: params.otp!, userName: params.userName!);
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(VerifyOtpResponseModel.fromJson(response.data));
      }
      return DataFailed(response.statusMessage);
    } on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(err.response?.data[Strings.error] ?? errorMessage);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return DataFailed(err.toString());
    }
  }

}

class VerifyOtpParam{
  final String? otp;
  final String? userName;

  VerifyOtpParam(this.otp, this.userName,);
}

