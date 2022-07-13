import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/auth/auth_screens/registration/identification/means_of_identification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/customButton.dart';
import '../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../shared_widgets/custom_buttom_sheet.dart';

class EmployedOptionScreen extends StatefulWidget {
  const EmployedOptionScreen({Key? key}) : super(key: key);

  @override
  _EmployedOptionScreenState createState() => _EmployedOptionScreenState();
}

class _EmployedOptionScreenState extends State<EmployedOptionScreen> {
  String? selectedSalaryRange;
  List<String> salaryRange = [
    "₦0 - ₦50,000",
    "₦50,000 - ₦200,000",
    "₦200,001 - ₦500,000",
    "₦500,001 - ₦1,000,000",
    "₦1000,001 and above"
  ];
  String? selectedEmploymentType;
  List<String> employmentType = [
    "Full-Time",
    "Contract",
  ];

  void showSalaryRangeBottomSheet(BuildContext context) {
    MyBottomSheet().showDismissibleBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height / 3,
        children: List.generate(
          salaryRange.length,
          (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedSalaryRange = salaryRange[index];
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
                          salaryRange[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                        ),
                        selectedSalaryRange == salaryRange[index]
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
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void showEmploymentTypeBottomSheet(BuildContext context) {
    MyBottomSheet().showDismissibleBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height / 4.5,
        children: List.generate(
          employmentType.length,
          (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedEmploymentType = employmentType[index];
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
                          employmentType[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                        ),
                        selectedEmploymentType == employmentType[index]
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
                    ),
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
          centerTitle: true,
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 35.0, bottom: 10),
            child: LinearProgressIndicator(
              color: kGreen,
              value: 0.6,
            ),
          ),
          title: Text(
            "Employed",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 75, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "What is your employer’s name?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    hintText: "Company name",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "What is your Occupation?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    hintText: "Your occupation",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "What is your position at your company?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    hintText: "Your position",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What is your type of employment?",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: kWhite, width: 0.7),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent)),
                      onPressed: () {
                        showEmploymentTypeBottomSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedEmploymentType ?? "Employment type",
                            style: TextStyle(
                                color: selectedEmploymentType == null
                                    ? const Color(0xff868484)
                                    : kWhite,
                                fontSize: 18),
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: kWhite)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What is your Salary range?",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: kWhite, width: 0.7),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent)),
                      onPressed: () {
                        showSalaryRangeBottomSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedSalaryRange ?? "Salary Range",
                            style: TextStyle(
                                color: selectedSalaryRange == null
                                    ? const Color(0xff868484)
                                    : kWhite,
                                fontSize: 18),
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: kWhite)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Are you politically exposed?",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
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
                        selectedBorderColor: Color(0xff2E4DBD),
                        unselectedBorderColor: Color(0xff2E4DBD),
                        crossGroupAlignment: CrossGroupAlignment.start,
                        borderRadius: BorderRadius.circular(25),
                        selectedColor: const Color(0xff8095E0),
                        buttonHeight: 50,
                        buttonWidth: MediaQuery.of(context).size.width / 2.3),
                    isRadio: false,
                    enableDeselect: true,
                    onSelected: (String value, index, isSelected) {},
                    buttons: ["Yes, I do", "No, I don’t"],
                    maxSelected: 1,
                  ),
                  const Spacer(),
                  ButtonWidget(
                      onPressed: () {
                        Get.to(() => const MeansOfIdentification());
                      },
                      buttonColor: kGreen,
                      borderRadius: 8,
                      buttonText: "Next",
                      height: 55,
                      width: double.maxFinite),
                  const Spacer(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
