import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/auth/auth_screens/registration/registration_success_loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../shared_widgets/customButton.dart';
import '../../../../shared_widgets/custom_appBar.dart';
import '../../../../shared_widgets/custom_pincode_field.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 35.0, bottom: 10),
            child: LinearProgressIndicator(
              color: kGreen,
              value: 0.4,
            ),
          ),
          title: Text(
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
          padding: const EdgeInsets.only(top: 35, left: 24, right: 24),
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
                            text: "081374484848.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kOrange)),
                      ])),
              const SizedBox(
                height: 80,
              ),
              PinCodeWidget(padding: 0.0,
                  onChanged: (String value) {}),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Code will resend in ",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: kWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                        children: [
                          TextSpan(
                              text: "00:20",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kOrange)),
                        ])),
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
                  onPressed: () {
                    Get.to(() => const RegistrationSuccessLoaderScreen());
                  },
                  buttonColor: kGreen,
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
    );
  }
}
