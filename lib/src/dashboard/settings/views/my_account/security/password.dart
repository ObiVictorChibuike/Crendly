import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/asset_path.dart';
import '../../../../../../constants/color_palette.dart';
import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Password",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            FormFieldWidget(
              hintText: "********",
              labelTitle: "Old Passcode",
            ),
            const SizedBox(
              height: 15,
            ),
            FormFieldWidget(
              hintText: "********",
              labelTitle: "New Passcode",
            ),
            const SizedBox(
              height: 15,
            ),
            FormFieldWidget(
              hintText: "********",
              labelTitle: "Confirm Passcode",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            ButtonWidget(
              onPressed: () {},
              buttonText: "Save new passcode",
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
      ),
    );
  }
}
