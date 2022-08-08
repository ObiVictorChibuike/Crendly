import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/auth/auth_screens/registration/qualification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../../../constants/asset_path.dart';
import '../../../../shared_widgets/customButton.dart';
import '../../../../shared_widgets/custom_appBar.dart';

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({Key? key}) : super(key: key);

  @override
  _MaritalStatusState createState() => _MaritalStatusState();
}

class _MaritalStatusState extends State<MaritalStatus> {
  bool? hasDependants;

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
            value: 0.3,
          ), centerTitle: false,
          appBarLabel: Text(
            "Marital Status",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What is your marital status?",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 15,
                ),
                GroupButton(
                  options: GroupButtonOptions(
                    spacing: 20,
                      selectedTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: kWhite, fontSize: 16),
                      unselectedTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: kWhite, fontSize: 16),
                      unselectedColor: Colors.transparent,
                      mainGroupAlignment: MainGroupAlignment.start,
                      unselectedBorderColor: kWhite,
                      crossGroupAlignment: CrossGroupAlignment.start,
                      borderRadius: BorderRadius.circular(25),
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width / 2.5),
                  isRadio: false,
                  onSelected: (String value, index, isSelected) {},
                  buttons: [
                    "Single",
                    "Married",
                    "Divorced",
                    "Separated",
                    "Widowed"
                  ],
                ),
                const SizedBox(height: 30,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Do you have dependents?",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 15,
                ),
                GroupButton(
                  options: GroupButtonOptions(
                    spacing: 20,
                      selectedTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: kWhite, fontSize: 16),
                      unselectedTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: kWhite, fontSize: 16),
                      unselectedColor: Colors.transparent,
                      mainGroupAlignment: MainGroupAlignment.start,
                      unselectedBorderColor: kWhite,
                      crossGroupAlignment: CrossGroupAlignment.start,
                      borderRadius: BorderRadius.circular(25),
                      selectedColor: const Color(0xff8095E0),
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width / 2.5),
                  isRadio: false,
                  enableDeselect: true,
                  onSelected: (String value, index, isSelected) {
                    if (index == 0 && value == "Yes, I do") {
                      setState(() {
                        hasDependants = isSelected;
                      });
                    } else {
                      setState(() {
                        hasDependants = false;
                      });
                    }
                  },
                  buttons: ["Yes, I do", "No, I don’t"],
                  maxSelected: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: kLightBackGroundColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                hasDependants == true
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Do you have dependents?",
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: kWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ))
                    : const SizedBox(),
                const SizedBox(
                  height: 15,
                ),
                hasDependants == true
                    ? GroupButton(
                        options: GroupButtonOptions(
                          spacing: 20,
                            selectedTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kWhite, fontSize: 16),
                            unselectedTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kWhite, fontSize: 16),
                            unselectedColor: Colors.transparent,
                            mainGroupAlignment: MainGroupAlignment.start,
                            unselectedBorderColor: kWhite,
                            crossGroupAlignment: CrossGroupAlignment.start,
                            borderRadius: BorderRadius.circular(25),
                            selectedColor: const Color(0xff8095E0),
                            buttonHeight: 50,
                            buttonWidth: MediaQuery.of(context).size.width / 2.5),
                        isRadio: false,
                        onSelected: (String value, index, isSelected) {},
                        buttons: ["1 to 2", "3 to 4", "5 & Above"],
                      )
                    : const SizedBox(),
                const SizedBox(height: 50,),
                ButtonWidget(
                    onPressed: () {
                      Get.to(() => const QualificationScreen());
                    },
                    buttonColor: kGreen,
                    borderRadius: 8,
                    buttonText: "Next",
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
