import 'dart:convert';

import 'package:crendly/data/remote/network_servcises/dio_service_config/app_config.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<Response?> login(
      {required String email, required String password}) async {
    var postBody = jsonEncode({
      "email": email,
      "password": password,
      "channelId": AppConfig.channelID
    });
    final response = await NetworkProvider().call(
        path: AppConfig.login, method: RequestMethod.post, body: postBody);
    return response;
  }

  Future<Response?> onBoardingStateOne({
    required String bvn,
    required String dateOfBirth,
    required String phoneNumber,
    required String email,
    // required String profileType,
    required String gender,
  }) async {
    var postBody = jsonEncode({
      "bvn": bvn,
      "dateOfBirth": dateOfBirth,
      "phoneNumber": phoneNumber,
      "email": email,
      "profileType": "Individual",
      "gender": gender,
      "channelId": AppConfig.channelID,
    });
    final response = await NetworkProvider().call(
        path: AppConfig.signUpStageOne,
        method: RequestMethod.post,
        body: postBody);
    return response;
  }

  Future<Response?> getResidenceCategories() async {
    final response = await NetworkProvider().call(
        path: AppConfig.getResidenceCategories, method: RequestMethod.get);
    return response;
  }

  Future<Response?> updatePersonalInformation(
      {required String userId,
      required String firstName,
      required String lastName,
      required String gender,
      required String email,
      required String phoneNumber,
      required String maritalStatus,
      required String educationalQualification,
      required String deviceType,
      required String dependents}) async {
    var postBody = jsonEncode({
      "picture": null,
      "phoneNumber": phoneNumber,
      "firstName": firstName,
      "middleName": null,
      "lastName": lastName,
      "gender": gender,
      "state": null,
      "lga": null,
      "email": email,
      "maritalStatus": maritalStatus,
      "educationalQualification": educationalQualification,
      "deviceType": deviceType,
      "dependents": dependents,
      "socials": [
        {"name": null, "handle": null}
      ]
    });
    final response = await NetworkProvider().call(
        path: "${AppConfig.updatePersonalInformation}$userId",
        method: RequestMethod.post,
        body: postBody);
    return response;
  }

  Future<Response?> verifyOtp({
    required String otp,
    required String userName,
  }) async {
    var postBody = jsonEncode({
      "otp": otp,
      "username": userName,
      "channelId": AppConfig.channelID,
    });
    final response = await NetworkProvider().call(
        path: AppConfig.verifyOtp, method: RequestMethod.post, body: postBody);
    return response;
  }

  Future<Response?> updateUserEmploymentDetails(
      {required String userId,
      String? employer,
      String? occupation,
      String? salaryOrIncomeRange,
      required bool politicallyExposed,
      String? position,
      String? employmentType,
      required String employmentStatus}) async {
    var postBody = jsonEncode({
      "userId": userId,
      "employer": employer,
      "occupation": occupation,
      "salaryOrIncomeRange": salaryOrIncomeRange,
      "politicallyExposed": politicallyExposed,
      "position": position,
      "employmentType": employmentType,
      "employmentStatus": employmentStatus
    });
    final response = await NetworkProvider().call(
        path: AppConfig.updateEmploymentDetails,
        method: RequestMethod.post,
        body: postBody);
    return response;
  }

  Future<Response?> updateUserRegulatoryId({
    required String userId,
    required int type,
    required String idNumber,
    String? issuanceDate,
    String? expiryDate,
    String? imagePath,
  }) async {
    var postBody = jsonEncode({
      "userId": userId,
      "type": type,
      "idNumber": idNumber,
      "issuanceDate": issuanceDate,
      "expiryDate": expiryDate,
      "imagePath": imagePath
    });
    final response = await NetworkProvider().call(
        path: AppConfig.updateRegulatoryId,
        method: RequestMethod.post,
        body: postBody);
    return response;
  }
}
