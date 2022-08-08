import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/auth/auth_screens/registration/email_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../shared_widgets/customButton.dart';
import '../../../../shared_widgets/custom_appBar.dart';
import '../../../../shared_widgets/custom_buttom_sheet.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(gender[index], style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        selectedGender == gender[index]
                            ? const Icon(Icons.check, size: 12, color: kOrange,)
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
            value: 0.1,
          ), centerTitle: false,
          appBarLabel: Text(
            "Your Personal \nInformation",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 35, left: 24, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Please confirm the perosnal information below is correct.",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400)),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormFieldWidget(
                            width: MediaQuery.of(context).size.width / 2.5,
                            hintText: "Emmanuel",
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormFieldWidget(
                            width: MediaQuery.of(context).size.width / 2.5,
                            hintText: "David",
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 25,
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
              const SizedBox(
                height: 25,
              ),
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
                hintText: "08/08/1994",
                suffixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: kWhite,
                  size: 25,
                ),
              ),
              const Spacer(),
              ButtonWidget(
                  onPressed: () {
                    Get.to(() => const EmailAddressScreen());
                  },
                  buttonColor: kGreen,
                  borderRadius: 8,
                  buttonText: "My info is correct",
                  height: 50,
                  width: double.maxFinite),
              const SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "My info is not correct",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kGreen,
                        fontSize: 16),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
