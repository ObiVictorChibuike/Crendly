import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../constants/asset_path.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';

class IdentityCard extends StatelessWidget {
  const IdentityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Identity Card",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Image.asset(AssetPath.IDCard),
            const SizedBox(
              height: 33,
            ),
            FormFieldWidget(
              labelTitle: "ID Number",
              hintText: "43251252547",
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: FormFieldWidget(
                    labelTitle: "Issue Date",
                    hintText: "___/___/_______",
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: FormFieldWidget(
                    labelTitle: "Expiry Date",
                    hintText: "___/___/_______",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
