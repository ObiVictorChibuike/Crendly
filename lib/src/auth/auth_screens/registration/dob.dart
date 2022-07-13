import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/auth/auth_screens/registration/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../shared_widgets/customButton.dart';
import '../../../../shared_widgets/custom_appBar.dart';
import '../../../../shared_widgets/custom_buttom_sheet.dart';

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({Key? key}) : super(key: key);

  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  String? selectedGender;
  List<String> gender = ["Male", "Female"];

  void showGenderBottomSheet(BuildContext context) {
    MyBottomSheet().showDismissibleBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height / 4.5,
        children: List.generate(
          gender.length,
          (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedGender = gender[index];
                  Get.back();
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          gender[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                        ),
                        selectedGender == gender[index]
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
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 35.0, bottom: 10),
            child: LinearProgressIndicator(
              color: kGreen,
              value: 0.2,
            ),
          ),
          title: Text(
            "Date of Birth & Gender",
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
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date of birth",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 10,
              ),
              const FormFieldWidget(
                hintText: "DD/MM/YY",
                suffixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: kWhite,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: kOrange.withOpacity(0.5),
                    radius: 8,
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: kOrange,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "It’s adviced that you  input your date of birth as it is on your BVN.",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gender",
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
                    showGenderBottomSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedGender ?? "Gender",
                        style: TextStyle(
                            color: selectedGender == null
                                ? const Color(0xff868484)
                                : kWhite,
                            fontSize: 18),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: kWhite)
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ButtonWidget(
                  onPressed: () {
                    Get.to(() => const PhoneNumberScreen());
                  },
                  buttonColor: kGreen,
                  borderRadius: 8,
                  buttonText: "Next",
                  height: 55,
                  width: double.maxFinite),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
