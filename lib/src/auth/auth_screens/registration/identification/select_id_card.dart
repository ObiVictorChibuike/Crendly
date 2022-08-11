import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/auth/auth_screens/registration/identification/upload_id_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../shared_widgets/custom_outlined_button.dart';

class SelectedIDCard extends StatefulWidget {
  const SelectedIDCard({Key? key}) : super(key: key);

  @override
  _SelectedIDCardState createState() => _SelectedIDCardState();
}

class _SelectedIDCardState extends State<SelectedIDCard> {
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
          ), centerTitle: false,
          appBarLabel: Text(
            "Select ID Card",
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AssetPath.id,
                  height: 200,
                  width: 300,
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Choose your preferred ID",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )),
                const SizedBox(
                  height: 35,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Make sure the document includes a \npicture of your face. ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 34,
                ),
                CustomOutlineButton(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  text: "International Passport",
                  height: 50,
                  color: Color(0xff2E4DBD),
                  buttonBorderRadius: 30,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlineButton(
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    text: "Drivers’ License",
                    height: 50,
                    color: Color(0xff2E4DBD),
                    buttonBorderRadius: 30,
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlineButton(
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    text: "National ID Card",
                    height: 50,
                    color: Color(0xff2E4DBD),
                    buttonBorderRadius: 30,
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlineButton(
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    text: "Voters Card",
                    height: 50,
                    color: Color(0xff2E4DBD),
                    buttonBorderRadius: 30,
                    onPressed: () {}),
                const SizedBox(height: 50,),
                ButtonWidget(
                    buttonColor: kGreen,
                    onPressed: () {
                      Get.to(() => const UploadIDCard());
                    },
                    buttonText: "Continue",
                    height: 50,
                    width: double.maxFinite),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
