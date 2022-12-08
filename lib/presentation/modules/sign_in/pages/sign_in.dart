import 'dart:developer';

import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/shared_widgets/custom_pincode_field.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/app/utils/loader/progress_loader.dart';
import 'package:crendly/app/utils/mixin/form_mixin.dart';
import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/presentation/modules/sign_in/controller/controller.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with FormMixin{

  //Keys
  final scaffoldKey = GlobalKey <ScaffoldState>();
  final formKey = GlobalKey <FormState>();


  void login(BuildContext context, SignInController controller)async{
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      ShowProgressDialog().show;
      await controller.login();
      if(controller.viewState.state == ResponseState.COMPLETE){
        ShowProgressDialog().hide;
        Get.offAll(()=> BottomNavigationBarScreen());
      }else if(controller.viewState.state == ResponseState.ERROR){
        ShowProgressDialog().hide;
        FlushBarHelper(context, controller.errorMessage).showErrorBar;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
        builder: (controller){
      return SafeArea(top: false, bottom: false,
        child: Scaffold(
          key: scaffoldKey,
            backgroundColor: kDarkBackGroundColor,
            appBar: CustomAppbar(centerTitle: false, bottomPadding: 0,
              appBarLabel: Text("Sign In", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
              ), decorationImagePath: AssetPath.fullTag,
              onBackPressed: () {
                Get.back();
              },
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Form(
                key: formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 36,),
                    Text("Sign in to see what's happening on your \naccount. Feel free to look around, it’s yours.", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 64,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text('Email', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: kWhite),)),
                    const SizedBox(
                      height: 8,
                    ),
                    FormFieldWidget(
                      expands: false,
                      labelTitle: "Email",
                      hintText: " Email",
                      validator: isValidEmailAddress,
                      controller: controller.emailController,
                    ),
                    const SizedBox(height: 16,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Passcode", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w400, color: kWhite, fontSize: 14,),)),
                    PinCodeWidget(
                        onChanged: (value) {},
                      validator: isRequired,
                      controller: controller.passcodeController,
                    ),
                    const SizedBox(height: 22,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Forgot Passcode?",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700, color: kGreen, fontSize: 14, decoration: TextDecoration.underline),)),
                    const SizedBox(height: 130,),
                    ButtonWidget(
                        onPressed: () {
                          login(context, controller);
                        },
                        buttonColor: kGreen,
                        buttonText: "Sign In",
                        height: 55,
                        width: double.maxFinite),
                    const SizedBox(
                      height: 37,
                    ),
                    Align(alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: 'Don’t have an account? ',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: kWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(text: 'Sign up', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700, decoration: TextDecoration.underline))
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}


