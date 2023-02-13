import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/data/local/local_storage.dart';
import 'package:crendly/data/model/auth/onboarding_stage_one_response_model.dart';
import 'package:crendly/data/model/auth/update_employment_details_response.dart';
import 'package:crendly/data/model/auth/update_personal_information_response.dart';
import 'package:crendly/data/model/auth/verify_otp_response_model.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:crendly/data/repository/cloudinary_repository/cloudinary_repository.dart';
import 'package:crendly/data/services/auth_services/auth_servcices.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/onboarding_stage_one_impl.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/update_employment_details_impl.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/update_personal_information_impl.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/update_regulatory_impl.dart';
import 'package:crendly/domain/auth/onboarding_and_registration_repository/verify_otp_impl.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/auth/residence_categories_response.dart';
import '../../../../../data/model/auth/update_regulatory_id_response.dart';
import '../../../../../domain/auth/onboarding_and_registration_repository/get_residence_categories.dart';

class RegistrationController extends GetxController {
  //Dependency Injection
  final cloudinary = Get.put(CloudinaryServiceImpl());
  final onBoardingStageOne =
      Get.put(OnBoardingStateOneImpl(AuthRepository(AuthServices())));
  final updatePersonalInformation =
      Get.put(UpdatePersonalInformation(AuthRepository(AuthServices())));
  final verifyOtp = Get.put(VerifyOtpImpl(AuthRepository(AuthServices())));
  final updateEmployeeDetails =
      Get.put(UpdateEmploymentDetails(AuthRepository(AuthServices())));
  final updateRegulatoryId =
      Get.put(UpdateRegulatoryId(AuthRepository(AuthServices())));
  Map<String, dynamic> userInfo = {};
  List<ResidenceCategoriesResponse>? areas;
  final residenceCategories =
      Get.put(GetResidenceCategories(AuthRepository(AuthServices())));

  Future<void> onInitializeLocalStorage() async {
    Get.put<LocalCachedData>(await LocalCachedData.create());
    super.onInit();
  }

  // user information
  Future<Map<String, dynamic>> getUserInformation() async {
    String? firstName = await LocalCachedData.instance.getUserFirstName();

    String? lastName = await LocalCachedData.instance.getUserLastName();
    String? gender = await LocalCachedData.instance.getUserGender();
    String? dob = await LocalCachedData.instance.getUserDOB();

    return {
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "dob": dob
    };
  }

  getResidenceAreaCategories() async {
    final List<ResidenceCategoriesResponse> response =
        await getResidenceCategories();
    areas = response;

    debugPrint("Area List $areas");
    update();
  }

  userInformation() async {
    userInfo = await getUserInformation();
    update();
  }

  //Form Controllers and variables
  final genderController = TextEditingController();
  final dateOfBirth = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final bvnController = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final educationalQualificationController = TextEditingController();
  final employerController = TextEditingController();
  final positionController = TextEditingController();
  final occupationController = TextEditingController();
  final idNumberController = TextEditingController();
  final issueDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  String? maritalStatus;
  String? dependents;
  bool? networkState;
  String? errorMessage;
  String? phoneNumber;
  String? salaryOrIncomeRange;
  bool? politicallyExposed;
  String? employmentStatus;
  String? employmentType;
  int? type;

  //Initialize State
  ViewState<OnBoardingStageOneResponseModel> viewState =
      ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState<OnBoardingStageOneResponseModel> viewState) {
    this.viewState = viewState;
  }

  //Initialize VerifyOtp State
  ViewState<VerifyOtpResponseModel> otpViewState =
      ViewState(state: ResponseState.EMPTY);

  void _setOtpViewState(ViewState<VerifyOtpResponseModel> viewState) {
    this.otpViewState = viewState;
  }

  //Update User Data
  ViewState<UpdatePersonalInformationResponse> updatePersonalInfoViewState =
      ViewState(state: ResponseState.EMPTY);

  void _setUpdatePersonalInfoViewState(
      ViewState<UpdatePersonalInformationResponse> viewState) {
    this.updatePersonalInfoViewState = viewState;
  }

  //Update Employment Details  Data
  ViewState<UpdateEmploymentDetailsResponse> updateEmploymentDetailsState =
      ViewState(state: ResponseState.EMPTY);

  void _setUpdateEmploymentDetailsState(
      ViewState<UpdateEmploymentDetailsResponse> viewState) {
    this.updateEmploymentDetailsState = viewState;
  }

  //Update RegulatoryId  Data
  ViewState<UpdateRegulatoryIdResponse> updateRegulatoryIdState =
      ViewState(state: ResponseState.EMPTY);

  void _setUpdateRegulatoryIdState(
      ViewState<UpdateRegulatoryIdResponse> viewState) {
    this.updateRegulatoryIdState = viewState;
  }

  // get Residence categories
  ViewState<ResidenceCategoriesResponseList> getResidenceCategoriesState =
      ViewState(state: ResponseState.EMPTY);

  void _setGetResidenceCategories(
      ViewState<ResidenceCategoriesResponseList> viewState) {
    this.getResidenceCategoriesState = viewState;
  }

  Future<void> saveOnBoardingStageOne() async {
    await onBoardingStageOne
        .execute(
            params: OnBoardingStageOneParam(
                bvnController.text,
                dateOfBirth.text,
                phoneNumber!.removeAllWhitespace,
                emailController.text,
                genderController.text))
        .then((value) async {
      if (value is DataSuccess || value.data?.data != null) {
        final token = value.data?.data?.accessToken;
        final userId = value.data!.data!.userId;
        final firstName = value.data!.data!.bvnData!.firstName;
        final lastName = value.data!.data!.bvnData!.lastName;
        final gender = value.data!.data!.bvnData!.gender;
        final dob = value.data!.data!.bvnData!.dateOfBirth;
        final mobile = value.data!.data!.bvnData!.mobile;
        await LocalCachedData.instance
            .cacheAuthToken(token: token)
            .whenComplete(() async {
          await LocalCachedData.instance.cacheUserId(userId: userId);
          await LocalCachedData.instance
              .cacheUserEmail(email: emailController.text);
          await LocalCachedData.instance
              .cacheUserFirstName(firstName: firstName);

          await LocalCachedData.instance.cacheUserLastName(lastName: lastName);

          await LocalCachedData.instance.cacheUserGender(gender: gender);

          await LocalCachedData.instance.cacheUserDOB(dob: dob);
          await LocalCachedData.instance
              .cacheUserPhoneNumber(phoneNumber: mobile);
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
      }
    });
  }

  Future<List<ResidenceCategoriesResponse>> getResidenceCategories() async {
    final response = await residenceCategories.noParamCall();
    if (response is DataSuccess || response.data != null) {
      return response.data!.residenceCategories;
    } else {
      throw Exception();
    }
  }

  Future<void> updateUserRegulatoryId(String filePath) async {
    final userId = await LocalCachedData.instance.getUserId();
    CloudinaryResponse response = await cloudinary.uploadFileOnCloudinary(
        filePath, CloudinaryResourceType.Auto);
    final imagePath = response.secureUrl;
    debugPrint("Response secure url: ${response.secureUrl}");
    debugPrint("Image path  url: $imagePath");
    await updateRegulatoryId
        .execute(
            params: UpdateRegulatoryIdParam(
                userId: userId, // "cf0dda32-e031-4569-8d07-1d0ac29a621e"
                idNumber: idNumberController.text,
                type: type,
                issuanceDate: issueDateController.text,
                expiryDate: expiryDateController.text,
                imagePath: imagePath))
        .then((value) async {
      if (value is DataSuccess || value.data?.data != null) {
        _setUpdateRegulatoryIdState(ViewState.complete(value.data!));
        update();
      }

      if (value is DataFailed || value.data?.data == null) {
        if (kDebugMode) {
          debugPrint("${value.error.toString()}");
        }
        errorMessage = value.error.toString();

        _setUpdateEmploymentDetailsState(
            ViewState.error(value.error.toString()));
        update();
      }
    });
  }

  Future<void> updateUserEmploymentDetails() async {
    final userId = await LocalCachedData.instance.getUserId();

    await updateEmployeeDetails
        .execute(
            params: UpdateEmploymentDetailsParam(
                userId: userId!,
                salaryOrIncomeRange: salaryOrIncomeRange,
                position: positionController.text,
                occupation: occupationController.text,
                employmentType: employmentType,
                employer: employerController.text,
                politicallyExposed: politicallyExposed!,
                employmentStatus: employmentStatus!))
        .then((value) async {
      if (value is DataSuccess || value.data?.data != null) {
        _setUpdateEmploymentDetailsState(ViewState.complete(value.data!));
        update();
      }

      if (value is DataFailed || value.data?.data == null) {
        if (kDebugMode) {
          debugPrint("${value.error.toString()}");
        }
        errorMessage = value.error.toString();

        _setUpdateEmploymentDetailsState(
            ViewState.error(value.error.toString()));
        update();
      }
    });
  }

  Future<void> updateInfo() async {
    final userId = await LocalCachedData.instance.getUserId();
    final deviceInfo = await getDeviceInfo();
    final email = await LocalCachedData.instance.getUserEmail();
    final firstName = await LocalCachedData.instance.getUserFirstName();
    final lastName = await LocalCachedData.instance.getUserLastName();
    final gender = await LocalCachedData.instance.getUserGender();
    final mobile = await LocalCachedData.instance.getUserPhoneNumber();
    await updatePersonalInformation
        .execute(
            params: UpdatePersonalInformationParam(
                userId: userId,
                firstName: firstName,
                lastName: lastName,
                gender: gender,
                email: email,
                phoneNumber: mobile,
                maritalStatus: maritalStatus,
                educationalQualification:
                    educationalQualificationController.text,
                deviceType: deviceInfo,
                dependents: dependents))
        .then((value) async {
      if (value is DataSuccess || value.data?.data != null) {
        _setUpdatePersonalInfoViewState(ViewState.complete(value.data!));
        update();
      }
      if (value is DataFailed || value.data?.data == null) {
        if (kDebugMode) {
          print(value.error.toString());
        }
        errorMessage = value.error.toString();
        _setUpdatePersonalInfoViewState(
            ViewState.error(value.error.toString()));
        update();
      }
    });
  }

  Future<void> verifyAuthOtp(
      {required String? otp, required String userName}) async {
    await verifyOtp
        .execute(params: VerifyOtpParam(otp, userName))
        .then((value) async {
      if (value is DataSuccess || value.data != null) {
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
      }
    });
  }

  Future<String> getDeviceInfo() async {
    final deviceName = await DeviceInformation.deviceName;
    final device = await DeviceInformation.deviceModel;
    final manufacturer = await DeviceInformation.deviceManufacturer;
    print("$manufacturer $device $deviceName");
    return "$manufacturer $device $deviceName";
  }

  @override
  void onInit() async {
    onInitializeLocalStorage();
    userInformation();

    getResidenceAreaCategories();

    super.onInit();
  }
}
