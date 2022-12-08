import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_pincode_field.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/app/utils/loader/progress_loader.dart';
import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/otp_verification/registration_success_loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final codeController = TextEditingController();
  //Keys
  final scaffoldKey = GlobalKey <ScaffoldState>();
  final formKey = GlobalKey <FormState>();

  void verifyOtp(BuildContext context, RegistrationController controller)async{
    if(formKey.currentState!.validate()){
      ShowProgressDialog().show;
      await controller.verifyAuthOtp(otp: codeController.text, userName: controller.phoneNumber!);
      if(controller.viewState.state == ResponseState.COMPLETE){
        ShowProgressDialog().hide;
        Get.offAll(() => const RegistrationSuccessLoaderScreen());
      }else if(controller.viewState.state == ResponseState.ERROR){
        ShowProgressDialog().hide;
        FlushBarHelper(context, controller.errorMessage).showErrorBar;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: RegistrationController(),
        builder: (controller){
      return SafeArea(top: false, bottom: false,
        child: Scaffold(backgroundColor: kDarkBackGroundColor,
          key: scaffoldKey,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(
              color: kGreen,
              value: 0.3,
            ), centerTitle: false,
            appBarLabel: Text(
              "OTP Verification",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                          "Enter verification code sent to your phone number ",
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                                text: "${controller.phoneNumber ?? ""}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kOrange)),
                          ])),
                  const SizedBox(
                    height: 59,
                  ),
                  PinCodeWidget(padding: 0.0,
                      controller: codeController,
                      validator: (value){
                    if(value!.isEmpty){
                      return "Please enter Otp";
                    }else if(value.length != 6){
                      return "Please enter valid OTP data";
                    }
                    return null;
                      },
                      onChanged: (String value) {

                        setState(() {});
                      }),
                  const SizedBox(
                    height: 13,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Code will resend in ",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: kWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                        ),
                        Countdown(
                          seconds: 120,
                          build: (BuildContext context, double time) => Text(
                            time.toInt().toString(),
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: kWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          onFinished: () {},
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Didn’t get the code? ", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                              Text("Resend Code", style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: kGreen, fontSize: 14, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  ButtonWidget(
                      onPressed: () => verifyOtp(context, controller),
                      buttonTextColor: codeController.text.length != 6 ? myGray : kDarkBackGroundColor,
                      buttonColor: codeController.text.length != 6 ? Color(0xff141B34) : kGreen,
                      borderRadius: 8,
                      buttonText: "Next",
                      height: 50,
                      width: double.maxFinite),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
