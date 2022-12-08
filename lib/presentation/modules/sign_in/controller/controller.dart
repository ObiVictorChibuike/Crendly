import 'dart:developer';

import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/data/local/local_storage.dart';
import 'package:crendly/data/model/auth/login_response.dart';
import 'package:crendly/data/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:crendly/data/repository/auth_repository/auth_repository.dart';
import 'package:crendly/data/services/auth_services/auth_servcices.dart';
import 'package:crendly/domain/auth/signin_repository/signin_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController{
  final _login = Get.put(Login(AuthRepository(AuthServices())));

  //Form Controllers
  final emailController = TextEditingController();
  final passcodeController = TextEditingController();

  //Variables
  String? errorMessage;
  bool togglePassword = true;
  String? userPassword;

  //Initialize State
  ViewState<LoginResponse> viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState<LoginResponse> viewState) {
    this.viewState = viewState;
  }

  void togglePasswordVisibility(){
    togglePassword = !togglePassword;
    update();
  }


  Future<void> login()async{
    await _login.execute(params: LoginParam(emailController.text, passcodeController.text)).then((value) async {
      if(value is DataSuccess || value.data?.data != null) {
        final token = value.data?.data?.accessToken;
        await LocalCachedData.instance.cacheAuthToken(token: token);
        await LocalCachedData.instance.cacheLoginStatus(isLoggedIn: true).whenComplete(() async {
          await LocalCachedData.instance.cachePassword(password: userPassword);
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