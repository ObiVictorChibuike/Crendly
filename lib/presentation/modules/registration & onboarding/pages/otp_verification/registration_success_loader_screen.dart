import 'dart:async';

import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/update_user_profile/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    Get.offAll(() => const PersonalInformation());
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
          bottomPadding: 0.0,
          title: LinearProgressIndicator(
            color: kGreen,
            value: 0.3,
          ),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: () {
            Get.back();
          },
        ),
        // body: Padding(
        //   padding: const EdgeInsets.only(top: 88, left: 24, right: 24),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Align(
        //           alignment: Alignment.topCenter,
        //           child: Text(
        //             "This would take a second.",
        //             style: Theme.of(context).textTheme.bodyText2?.copyWith(
        //                 color: kWhite,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold),
        //           )),
        //       const SizedBox(
        //         height: 53,
        //       ),
        //       SizedBox(
        //         height: 60,
        //         width: 60,
        //         child: CircularProgressIndicator.adaptive(
        //           strokeWidth: 15.0,
        //           backgroundColor: kOrange,
        //         ),
        //       ),
        //       const Spacer()
        //     ],
        //   ),
        // ),
      ),
    );
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () => showMyDialog(),
    );
    super.initState();
  }
}
