import 'package:crendly/core/use_cases/use_cases.dart';
import 'package:crendly/data/model/auth/residence_categories_response.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../app/constants/http_status.dart';
import '../../../app/constants/strings.dart';
import '../../../data/remote/network_servcises/dio_service_config/dio_error.dart';

class GetResidenceCategories
    implements noParamUseCases<DataState<ResidenceCategoriesResponseList>> {
  final AuthRepository _authRepository;
  GetResidenceCategories(this._authRepository);

  @override
  Future<DataState<ResidenceCategoriesResponseList>> noParamCall() async {
    try {
      final response = await _authRepository.getResidenceCategories();

      if (response!.statusCode == HttpResponseStatus.ok ||
          response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(
            ResidenceCategoriesResponseList.fromJson(response.data));
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
