import 'package:crendly/data/services/auth_services/auth_servcices.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(this._authServices);

  Future<Response?> login({required String email, required String password}) => _authServices.login(email: email, password: password,);

  Future<Response?> onBoardingStateOne({required String bvn, required String dateOfBirth, required String phoneNumber,
    required String email, required String gender}) => _authServices.onBoardingStateOne(bvn: bvn, dateOfBirth: dateOfBirth, phoneNumber: phoneNumber, email: email, gender: gender);

  Future<Response?> updatePersonalInformation({required String userId, required String firstName, required String lastName, required String gender,
    required String email, required String phoneNumber, required String maritalStatus,
    required String educationalQualification, required String deviceType, required String dependents}) =>
      _authServices.updatePersonalInformation(userId: userId, firstName: firstName, lastName: lastName, gender: gender, email: email, phoneNumber: phoneNumber,
          maritalStatus: maritalStatus, educationalQualification: educationalQualification, deviceType: deviceType, dependents: dependents);

  Future<Response?> verifyOtp({required String otp, required String userName}) => _authServices.verifyOtp(otp: otp, userName: userName);


}