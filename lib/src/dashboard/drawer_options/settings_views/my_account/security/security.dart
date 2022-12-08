import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/my_account/security/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        appBarLabel: Text(
          "Security",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
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
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: kWhite,
                  )),
              labelTitle: "My Passcode",
            ),
            const SizedBox(
              height: 77,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => Password()));
              },
              child: Text(
                "Change my Passcode",
                style: TextStyle(
                    color: kGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
