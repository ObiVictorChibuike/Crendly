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

class SelfEmployedOptionScreen extends StatefulWidget {
  const SelfEmployedOptionScreen({Key? key}) : super(key: key);

  @override
  _SelfEmployedOptionScreenState createState() =>
      _SelfEmployedOptionScreenState();
}

class _SelfEmployedOptionScreenState extends State<SelfEmployedOptionScreen> {
  String? selectedIncomeRange;
  List<String> incomeRange = [
    "₦0 - ₦50,000",
    "₦50,000 - ₦200,000",
    "₦200,001 - ₦500,000",
    "₦500,001 - ₦1,000,000",
    "₦1000,001 and above"
  ];

  void showSalaryRangeBottomSheet(BuildContext context) {
    MyBottomSheet().showDismissibleBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height / 3,
        children: List.generate(
          incomeRange.length,
          (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIncomeRange = incomeRange[index];
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
                          incomeRange[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                        ),
                        selectedIncomeRange == incomeRange[index]
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
          title: LinearProgressIndicator(
            color: kGreen,
            value: 0.6,
          ),
          appBarLabel: Text(
            "Self Employed",
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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What is your Income range?",
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
                        showSalaryRangeBottomSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedIncomeRange ?? "Income Range",
                            style: TextStyle(
                                color: selectedIncomeRange == null
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
                    height: 50,
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
                    onSelected: (String value, index, isSelected) {},
                    buttons: ["Yes, I do", "No, I don’t"],
                    maxSelected: 1,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  ButtonWidget(
                      onPressed: () {
                        Get.to(() => const MeansOfIdentification());
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
  }
}
