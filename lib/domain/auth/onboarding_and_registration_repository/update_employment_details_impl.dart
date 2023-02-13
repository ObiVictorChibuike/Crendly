import 'package:crendly/app/constants/http_status.dart';
import 'package:crendly/app/constants/strings.dart';
import 'package:crendly/data/model/auth/update_employment_details_response.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/use_cases/use_cases.dart';
import '../../../data/remote/network_servcises/dio_service_config/dio_error.dart';

class UpdateEmploymentDetails
    implements
        useCase<DataState<UpdateEmploymentDetailsResponse>,
            UpdateEmploymentDetailsParam> {
  final AuthRepository _authRepository;

  UpdateEmploymentDetails(this._authRepository);

  @override
  Future<DataState<UpdateEmploymentDetailsResponse>> execute(
      {required UpdateEmploymentDetailsParam params}) async {
    try {
      final response = await _authRepository.updateEmploymentDetails(
          userId: params.userId,
          politicallyExposed: params.politicallyExposed,
          employmentStatus: params.employmentStatus,
          employer: params.employer,
          employmentType: params.employmentType,
          occupation: params.occupation,
          position: params.position,
          salaryOrIncomeRange: params.salaryOrIncomeRange);

      if (response!.statusCode == HttpResponseStatus.ok ||
          response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(
            UpdateEmploymentDetailsResponse.fromJson(response.data));
      }
      return DataFailed(response.statusMessage);
    } on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      if (kDebugMode) {
        debugPrint("$errorMessage");
      }
      return DataFailed(err.response?.data[Strings.error] ?? errorMessage);
    } catch (err) {
      if (kDebugMode) {
        debugPrint("$err");
      }
      return DataFailed(err.toString());
    }
  }
}

class UpdateEmploymentDetailsParam {
  final String userId;
  final String? employer;
  final String? occupation;
  final String? salaryOrIncomeRange;
  final bool politicallyExposed;
  final String? position;
  final String? employmentType;
  final String employmentStatus;

  UpdateEmploymentDetailsParam(
      {required this.userId,
      this.employer,
      this.occupation,
      this.salaryOrIncomeRange,
      required this.politicallyExposed,
      this.position,
      this.employmentType,
      required this.employmentStatus});
}
