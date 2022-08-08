import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/employment_status_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../shared_widgets/customButton.dart';
import '../../../../shared_widgets/custom_appBar.dart';
import '../../../../shared_widgets/custom_buttom_sheet.dart';

class QualificationScreen extends StatefulWidget {
  const QualificationScreen({Key? key}) : super(key: key);

  @override
  _QualificationScreenState createState() => _QualificationScreenState();
}

class _QualificationScreenState extends State<QualificationScreen> {
  String? selectedQualification;
  List<String> qualification = [
    "Primary Education",
    "Secondary Education",
    "Bachelor’s Degree",
    "Bachelors + Professional Qualification",
    "Masters Degree/PHD",
    "Vocational Training",
    "None"
  ];

  void showGenderBottomSheet(BuildContext context) {
    MyBottomSheet().showDismissibleBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height / 3,
        children: List.generate(
          qualification.length,
          (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedQualification = qualification[index];
                  Get.back();
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          qualification[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                        ),
                        selectedQualification == qualification[index]
                            ? const Icon(
                                Icons.check,
                                size: 12,
                                color: kOrange,
                              )
                            : const SizedBox()
                      ],
                    ),
                    const Divider(
                      color: kLighterBackGroundColor,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

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
            value: 0.4,
          ), centerTitle: false,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What is your highest educational qualification?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(color: kWhite, width: 0.7),
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {
                    showGenderBottomSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedQualification ?? "Qualification", style: TextStyle(color: selectedQualification == null ? const Color(0xff868484) : kWhite, fontSize: 18),),
                      const Icon(Icons.keyboard_arrow_down, color: kWhite)
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ButtonWidget(
                  onPressed: () {
                    Get.to(() => const EmploymentStatusOptions());
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
    );
  }
}
