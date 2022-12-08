import 'package:crendly/app/constants/http_status.dart';
import 'package:crendly/app/constants/strings.dart';
import 'package:crendly/data/model/auth/onboarding_stage_one_response_model.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/use_cases/use_cases.dart';


class OnBoardingStateOneImpl implements useCase<DataState<OnBoardingStageOneResponseModel>, OnBoardingStageOneParam> {
  final AuthRepository _authRepository;

  OnBoardingStateOneImpl(this._authRepository);

  @override
  Future<DataState<OnBoardingStageOneResponseModel>> execute({required OnBoardingStageOneParam params}) async{
    try {
      final response = await _authRepository.onBoardingStateOne(bvn: params.bvn!, dateOfBirth: params.dateOfBirth!,
          phoneNumber: params.phoneNumber!, email: params.email!, gender: params.gender!);
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(OnBoardingStageOneResponseModel.fromJson(response.data));
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

class OnBoardingStageOneParam{
  final String? bvn;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? email;
  final String? gender;

  OnBoardingStageOneParam(this.bvn, this.dateOfBirth, this.phoneNumber, this.email, this.gender);
}

