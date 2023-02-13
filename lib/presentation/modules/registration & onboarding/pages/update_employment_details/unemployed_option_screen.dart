import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../../../../app/utils/flush_bar/flushbar_helper.dart';
import '../../../../../app/utils/loader/progress_loader.dart';
import '../../../../../core/state/view_state.dart';
import '../update_regulatory_id/means_of_identification.dart';

class UnemployedOptionScreen extends StatefulWidget {
  const UnemployedOptionScreen({Key? key}) : super(key: key);

  @override
  _UnemployedOptionScreenState createState() => _UnemployedOptionScreenState();
}

class _UnemployedOptionScreenState extends State<UnemployedOptionScreen> {
  void updateEmploymentDetails(
      BuildContext context, RegistrationController controller) async {
    controller.employmentStatus = "Unemployed";
    ShowProgressDialog().show;
    await controller.updateUserEmploymentDetails();
    if (controller.updateEmploymentDetailsState.state ==
        ResponseState.COMPLETE) {
      ShowProgressDialog().hide;
      Get.to(() => const MeansOfIdentification());
    } else if (controller.updateEmploymentDetailsState.state ==
        ResponseState.ERROR) {
      ShowProgressDialog().hide;
      FlushBarHelper(context, controller.errorMessage).showErrorBar;
    }
  }

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
                centerTitle: true,
                title: LinearProgressIndicator(
                  color: kGreen,
                  value: 0.6,
                ),
                appBarLabel: Text(
                  "Unemployed",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Are you politically exposed?",
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
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2.5),
                          isRadio: false,
                          enableDeselect: true,
                          onSelected: (String value, index, isSelected) {
                            if (value == "Yes, I do") {
                              controller.politicallyExposed = true;
                            }
                            if (value == "No, I don’t") {
                              controller.politicallyExposed = false;
                            }
                          },
                          buttons: ["Yes, I do", "No, I don’t"],
                          maxSelected: 1,
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        ButtonWidget(
                            onPressed: () {
                              if (controller.politicallyExposed == null) {
                                FlushBarHelper(context,
                                        "Please select political exposure")
                                    .showErrorBar;
                              } else {
                                updateEmploymentDetails(context, controller);
                              }
                            },
                            buttonColor: kGreen,
                            borderRadius: 8,
                            buttonText: "Next",
                            height: 50,
                            width: double.maxFinite),
                        const Spacer(),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
