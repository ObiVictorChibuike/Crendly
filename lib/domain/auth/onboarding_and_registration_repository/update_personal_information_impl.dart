import 'package:crendly/app/constants/http_status.dart';
import 'package:crendly/app/constants/strings.dart';
import 'package:crendly/data/model/auth/update_personal_information_response.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/use_cases/use_cases.dart';

class UpdatePersonalInformation
    implements
        useCase<DataState<UpdatePersonalInformationResponse>,
            UpdatePersonalInformationParam> {
  final AuthRepository _authRepository;

  UpdatePersonalInformation(this._authRepository);

  @override
  Future<DataState<UpdatePersonalInformationResponse>> execute(
      {required UpdatePersonalInformationParam params}) async {
    try {
      final response = await _authRepository.updatePersonalInformation(
          userId: params.userId!,
          firstName: params.firstName!,
          lastName: params.lastName!,
          gender: params.gender!,
          email: params.email!,
          phoneNumber: params.phoneNumber!,
          maritalStatus: params.maritalStatus!,
          educationalQualification: params.educationalQualification!,
          deviceType: params.deviceType!,
          dependents: params.dependents!);
      if (response!.statusCode == HttpResponseStatus.ok ||
          response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(
            UpdatePersonalInformationResponse.fromJson(response.data));
      }
      debugPrint(
          "Error code: ${response.statusCode} \n message: ${response.statusMessage}");
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

class UpdatePersonalInformationParam {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? email;
  final String? phoneNumber;
  final String? maritalStatus;
  final String? educationalQualification;
  final String? deviceType;
  final String? dependents;

  UpdatePersonalInformationParam(
      {this.userId,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phoneNumber,
      this.maritalStatus,
      this.educationalQualification,
      this.deviceType,
      this.dependents});
}
