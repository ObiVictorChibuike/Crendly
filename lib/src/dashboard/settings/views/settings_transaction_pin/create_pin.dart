import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_pincode_field.dart';
import 'package:crendly/src/dashboard/settings/views/settings_transaction_pin/my_pin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/customButton.dart';
import '../../../../../shared_widgets/custom_appBar.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Create PIN",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.082,
          ),
          Text(
            "New PIN",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          PinCodeWidget(
            padding: 80,
            inactiveFillColor: kLightBackGroundColor,
            mainAxisAlignment: MainAxisAlignment.start,
            length: 4,
            outerPadding: const EdgeInsets.only(right: 11),
            onChanged: (String value) {},
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            "Confirm PIN",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          PinCodeWidget(
            padding: 80,
            inactiveFillColor: kLightBackGroundColor,
            mainAxisAlignment: MainAxisAlignment.start,
            length: 4,
            outerPadding: const EdgeInsets.only(right: 11),
            onChanged: (String value) {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
          ),
          ButtonWidget(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (builder) => MyPin()));
            },
            buttonText: "Setup PIN",
            height: 50,
            width: 347,
            buttonTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kDarkBackGroundColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
            buttonColor: kGreen,
          )
        ],
      ),
    );
  }
}
