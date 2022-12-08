import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/data/local/local_storage.dart';
import 'package:crendly/data/model/auth/onboarding_stage_one_response_model.dart';
import 'package:crendly/data/model/auth/update_personal_information_response.dart';
import 'package:crendly/data/model/auth/verify_otp_response_model.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:crendly/data/services/auth_services/auth_servcices.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/onboarding_stage_one_impl.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/update_personal_information_impl.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/verify_otp_impl.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegistrationController extends GetxController{

  //Dependency Injection
  final onBoardingStageOne = Get.put(OnBoardingStateOneImpl(AuthRepository(AuthServices())));
  final updatePersonalInformation = Get.put(UpdatePersonalInformation(AuthRepository(AuthServices())));
  final verifyOtp = Get.put(VerifyOtpImpl(AuthRepository(AuthServices())));

  //Form Controllers and variables
  final genderController = TextEditingController();
  final dateOfBirth = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final bvnController = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final educationalQualificationController = TextEditingController();
  String? maritalStatus;
  String? hasNoDependents;
  String? hasDependents;
  bool? networkState;
  String? errorMessage;
  String? phoneNumber;


  //Initialize State
  ViewState<OnBoardingStageOneResponseModel> viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState<OnBoardingStageOneResponseModel> viewState) {
    this.viewState = viewState;
  }


  //Initialize VerifyOtp State
  ViewState<VerifyOtpResponseModel> otpViewState = ViewState(state: ResponseState.EMPTY);

  void _setOtpViewState(ViewState<VerifyOtpResponseModel> viewState) {
    this.otpViewState = viewState;
  }

  //Update User Data
  ViewState<UpdatePersonalInformationResponse> updatePersonalInfoViewState = ViewState(state: ResponseState.EMPTY);

  void _setUpdatePersonalInfoViewState(ViewState<UpdatePersonalInformationResponse> viewState) {
    this.updatePersonalInfoViewState = viewState;
  }



  Future<void> saveOnBoardingStageOne()async{
    await onBoardingStageOne.execute(params: OnBoardingStageOneParam(bvnController.text, dateOfBirth.text,
        phoneNumber!.removeAllWhitespace, emailController.text, genderController.text)).then((value) async {
      if(value is DataSuccess || value.data?.data != null) {
        final token = value.data?.data?.accessToken;
        final userId = value.data!.data!.userId;
        await LocalCachedData.instance.cacheAuthToken(token: token).whenComplete(() async {
          await LocalCachedData.instance.cacheUserId(userId: userId);
          await LocalCachedData.instance.cacheUserEmail(email: emailController.text);
          _setViewState(ViewState.complete(value.data!));
          update();
        });
      }
      if (value is DataFailed || value.data?.data == null) {
        if (kDebugMode) {
          print(value.error.toString());
        }
        errorMessage = value.error.toString();
        _setViewState(ViewState.error(value.error.toString()));
        update();
      }}
    );
  }


  Future<void> updateInfo()async{
    final userId = await LocalCachedData.instance.getUserId();
    final deviceInfo = await getDeviceInfo();
    final email = await LocalCachedData.instance.getUserEmail();
    await updatePersonalInformation.execute(params: UpdatePersonalInformationParam(userId, firstName.text, lastName.text,
        genderController.text, email, phoneNumber, maritalStatus, educationalQualificationController.text,
        deviceInfo, hasNoDependents != null ? hasNoDependents : hasNoDependents)).then((value) async {
      if(value is DataSuccess || value.data?.data != null) {
        _setUpdatePersonalInfoViewState(ViewState.complete(value.data!));
        update();
      }
      if (value is DataFailed || value.data?.data == null) {
        if (kDebugMode) {
          print(value.error.toString());
        }
        errorMessage = value.error.toString();
        _setUpdatePersonalInfoViewState(ViewState.error(value.error.toString()));
        update();
      }}
    );
  }


  Future<void> verifyAuthOtp({required String? otp, required String userName})async{
    await verifyOtp.execute(params: VerifyOtpParam(otp, userName)).then((value) async {
      if(value is DataSuccess || value.data != null) {
        _setOtpViewState(ViewState.complete(value.data!));
          update();
      }
      if (value is DataFailed || value.data == null) {
        if (kDebugMode) {
          print(value.error.toString());
        }
        errorMessage = value.error.toString();
        _setOtpViewState(ViewState.error(value.error.toString()));
        update();
      }}
    );
  }

  Future<String> getDeviceInfo() async {
    final deviceName = await DeviceInformation.deviceName;
    final device = await DeviceInformation.deviceModel;
    final manufacturer = await DeviceInformation.deviceManufacturer;
    print("$manufacturer $device $deviceName");
    return "$manufacturer $device $deviceName";
  }

  Future<void> onInitializeLocalStorage() async {
    Get.put<LocalCachedData>(await LocalCachedData.create());
    super.onInit();
  }

  @override
  void onInit() {
    onInitializeLocalStorage();
    super.onInit();
  }

}