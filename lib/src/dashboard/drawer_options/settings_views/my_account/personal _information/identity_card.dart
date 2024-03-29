import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityCard extends StatelessWidget {
  const IdentityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        appBarLabel: Text(
          "Identity Card",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
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
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: FormFieldWidget(
                          labelTitle: "Issue Date",
                          hintText: "___/___/_______",
                        ),
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
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
