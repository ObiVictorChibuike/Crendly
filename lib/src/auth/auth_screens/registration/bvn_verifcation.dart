import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/auth/auth_screens/registration/dob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_widgets/customButton.dart';
import '../../../../shared_widgets/custom_appBar.dart';

class BVNVerification extends StatefulWidget {
  const BVNVerification({Key? key}) : super(key: key);

  @override
  _BVNVerificationState createState() => _BVNVerificationState();
}

class _BVNVerificationState extends State<BVNVerification> {
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
              value: 0.1,
            ),
          ),
          title: Text(
            "BVN",
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
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Provide your BVN",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 10,
              ),
              const FormFieldWidget(
                labelText: "Enter BVN",
                keyboardType: TextInputType.number,
              ),
              const Spacer(
                flex: 5,
              ),
              ButtonWidget(
                  onPressed: () {
                    Get.to(() => const DateOfBirth());
                  },
                  buttonColor: kGreen,
                  buttonText: "Next",
                  height: 50,
                  width: double.maxFinite),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Can’t get your BVN? Dial *565*0#",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: kWhite, fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const Spacer(
                flex: 5,
              ),
              Text(
                "Don’t have a BVN at the moment? ",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Continue without BVN',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: kGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ),
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
