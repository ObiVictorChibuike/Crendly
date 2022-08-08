import 'dart:async';

import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/auth/auth_screens/registration/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../shared_widgets/custom_appBar.dart';

class RegistrationSuccessLoaderScreen extends StatefulWidget {
  const RegistrationSuccessLoaderScreen({Key? key}) : super(key: key);

  @override
  _RegistrationSuccessLoaderScreenState createState() =>
      _RegistrationSuccessLoaderScreenState();
}

class _RegistrationSuccessLoaderScreenState
    extends State<RegistrationSuccessLoaderScreen> {
  showMyDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(
              flex: 3,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kGreen, width: 2),
                    color: const Color(0xff081952)),
                child: const Center(
                    child: Icon(
                  Icons.phone_android_rounded,
                  color: kOrange,
                  size: 35,
                )),
              ),
            ),
            Container(
              height: 60,
              width: 2,
              color: kGreen,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "OTP Verification successful",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 2,
              color: kGreen,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: CustomOutlineButton(
                  backGroundColor: const Color(0xff081952),
                  text: "Ok",
                  height: 50,
                  onPressed: () {
                    Get.to(() => const PersonalInformation());
                  }),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          title: LinearProgressIndicator(
            color: kGreen,
            value: 0.5,
          ),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 75, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "This would take a second.",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 15.0,
                  backgroundColor: kOrange,
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => showMyDialog(),
    );
    super.initState();
  }
}
