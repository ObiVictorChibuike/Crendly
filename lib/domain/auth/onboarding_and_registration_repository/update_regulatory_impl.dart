import 'package:crendly/app/constants/http_status.dart';
import 'package:crendly/app/constants/strings.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/use_cases/use_cases.dart';
import '../../../data/model/auth/update_regulatory_id_response.dart';

class UpdateRegulatoryId
    implements
        useCase<DataState<UpdateRegulatoryIdResponse>,
            UpdateRegulatoryIdParam> {
  final AuthRepository _authRepository;

  UpdateRegulatoryId(this._authRepository);

  @override
  Future<DataState<UpdateRegulatoryIdResponse>> execute(
      {required UpdateRegulatoryIdParam params}) async {
    try {
      final response = await _authRepository.updateRegulatoryId(
          userId: params.userId!,
          type: params.type!,
          idNumber: params.idNumber!,
          issuanceDate: params.issuanceDate!,
          expiryDate: params.expiryDate!,
          imagePath: params.imagePath);
      if (response!.statusCode == HttpResponseStatus.ok ||
          response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(UpdateRegulatoryIdResponse.fromJson(response.data));
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

class UpdateRegulatoryIdParam {
  final String? userId;
  final int? type;
  final String? idNumber;
  final String? issuanceDate;
  final String? expiryDate;
  final String? imagePath;

  UpdateRegulatoryIdParam(
      {this.userId,
      this.type,
      this.issuanceDate,
      this.expiryDate,
      this.idNumber,
      this.imagePath});
}
