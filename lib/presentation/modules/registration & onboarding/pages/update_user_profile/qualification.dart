import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/drop_down.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/app/utils/loader/progress_loader.dart';
import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/constants/asset_path.dart';
import '../update_employment_details/employment_status_options.dart';

class QualificationScreen extends StatefulWidget {
  const QualificationScreen({Key? key}) : super(key: key);

  @override
  _QualificationScreenState createState() => _QualificationScreenState();
}

class _QualificationScreenState extends State<QualificationScreen> {
  String? selectedQualification;
  List<String> qualification = [
    "None",
    "Vocational Training",
    "Primary Education",
    "Secondary Education",
    "Bachelor’s Degree",
    "Bachelors + Professional Qualification",
    "Masters Degree/PHD",
  ];

  //Keys
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  void updatePersonalInfo(
      BuildContext context, RegistrationController controller) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ShowProgressDialog().show;
      await controller.updateInfo();
      if (controller.updatePersonalInfoViewState.state ==
          ResponseState.COMPLETE) {
        ShowProgressDialog().hide;
        Get.offAll(() => EmploymentStatusOptions());
      } else if (controller.updatePersonalInfoViewState.state ==
          ResponseState.ERROR) {
        ShowProgressDialog().hide;
        FlushBarHelper(context, controller.errorMessage).showErrorBar;
      }
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
              key: scaffoldKey,
              backgroundColor: kDarkBackGroundColor,
              appBar: CustomAppbar(
                title: LinearProgressIndicator(
                  color: kGreen,
                  value: 0.4,
                ),
                centerTitle: false,
                appBarLabel: Text(
                  "Educational Background",
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What is your highest educational qualification?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      DropList(
                        valueName:
                            controller.educationalQualificationController,
                        iterable: qualification,
                        hintText: 'Qualification',
                        dropdownMaxHeight: 336,
                      ),
                      const Spacer(),
                      ButtonWidget(
                          onPressed: () {
                            if (controller.educationalQualificationController
                                .text.isEmpty) {
                              FlushBarHelper(context,
                                      "Educational Qualification is required")
                                  .showErrorBar;
                            } else {
                              updatePersonalInfo(context, controller);
                            }
                          },
                          buttonColor: kGreen,
                          borderRadius: 8,
                          buttonText: "Next",
                          height: 50,
                          width: double.maxFinite),
                      const Spacer(
                        flex: 5,
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
