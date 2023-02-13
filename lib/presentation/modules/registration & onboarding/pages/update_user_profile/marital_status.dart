import 'dart:developer';

import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/update_user_profile/qualification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({Key? key}) : super(key: key);

  @override
  _MaritalStatusState createState() => _MaritalStatusState();
}

class _MaritalStatusState extends State<MaritalStatus> {
  bool hasDependents = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: kDarkBackGroundColor,
              appBar: CustomAppbar(
                bottomPadding: 0.0,
                title: LinearProgressIndicator(
                  color: kGreen,
                  value: 0.35,
                ),
                centerTitle: false,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      GroupButton(
                        options: GroupButtonOptions(
                            spacing: 6,
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
                            selectedBorderColor: kDarkPurple,
                            selectedColor: kDarkPurple,
                            crossGroupAlignment: CrossGroupAlignment.start,
                            borderRadius: BorderRadius.circular(25),
                            buttonHeight: 44,
                            buttonWidth:
                                MediaQuery.of(context).size.width / 3.6),
                        isRadio: true,
                        onSelected: (String value, index, isSelected) {
                          controller.maritalStatus = value;
                        },
                        buttons: [
                          "Single",
                          "Married",
                          "Divorced",
                          "Separated",
                          "Widowed"
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Do you have dependents?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      GroupButton(
                        options: GroupButtonOptions(
                            spacing: 6,
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
                            selectedBorderColor: kDarkPurple,
                            selectedColor: kDarkPurple,
                            crossGroupAlignment: CrossGroupAlignment.start,
                            borderRadius: BorderRadius.circular(25),
                            buttonHeight: 44,
                            buttonWidth:
                                MediaQuery.of(context).size.width / 2.4),
                        isRadio: true,
                        enableDeselect: false,
                        onSelected: (String value, index, isSelected) {
                          if (value == "Yes, I do") {
                            setState(() {
                              hasDependents = true;
                              controller.dependents = null;
                            });
                          } else {
                            setState(() {
                              hasDependents = false;

                              ;
                            });
                          }

                          if (value == "No, I don’t") {
                            setState(() {
                              hasDependents = false;
                              controller.dependents = "None";
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
                      SizedBox(
                        height: hasDependents ? 20 : 176,
                      ),
                      hasDependents
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Do you have dependents?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        color: kWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                              ))
                          : const SizedBox(),
                      const SizedBox(
                        height: 15,
                      ),
                      hasDependents
                          ? GroupButton(
                              options: GroupButtonOptions(
                                  spacing: 6,
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
                                  crossGroupAlignment:
                                      CrossGroupAlignment.start,
                                  borderRadius: BorderRadius.circular(25),
                                  selectedBorderColor: kDarkPurple,
                                  selectedColor: kDarkPurple,
                                  buttonHeight: 44,
                                  buttonWidth:
                                      MediaQuery.of(context).size.width / 2.4),
                              isRadio: true,
                              onSelected: (String value, index, isSelected) {
                                setState(() {
                                  controller.dependents =
                                      value.trim().toString();
                                  // controller.hasDependents = value;
                                });
                              },
                              buttons: ["1 to 2", "3 to 4", "5 & Above"],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonWidget(
                          onPressed: () {
                            if (controller.maritalStatus == null) {
                              FlushBarHelper(
                                      context, "Please, select marital status")
                                  .showErrorBar;
                            } else if (hasDependents) {
                              if (controller.dependents == null) {
                                FlushBarHelper(context,
                                        "Please, select dependent status")
                                    .showErrorBar;
                              } else {
                                debugPrint(
                                    "Dependents ${controller.dependents}");
                                Get.to(() => const QualificationScreen());
                              }
                            } else {
                              Get.to(() => const QualificationScreen());
                            }
                          },
                          buttonColor: kGreen,
                          borderRadius: 8,
                          buttonText: "Next",
                          height: 50,
                          width: double.maxFinite),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
