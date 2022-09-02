import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/customButton.dart';
import '../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../shared_widgets/custom_dialog_widget.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  String? selectedOption;
  List<String> deleteOptions = [
    "I have issues with the platform",
    "Loans are hard to get here",
    "I want to erase my data",
    "I am not using it",
    "Others"
  ];
  showDeleteOptionDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2.5,
        MediaQuery.of(context).size.width / 1.3, [
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  ...List.generate(
                    deleteOptions.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedOption = deleteOptions[index];
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    deleteOptions[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            color: kWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                  ),
                                  selectedOption == deleteOptions[index]
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
                  )
                ]),
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    void deleteAccountBottomSheet(context) {
      Get.bottomSheet(
          FractionallySizedBox(
            heightFactor: 0.65,
            child: Container(
                decoration: BoxDecoration(
                    color: kDarkBackGroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.8,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: StatefulBuilder(builder: (context, mySetState) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            color: kOrange,
                                            size: 25,
                                          )),
                                    ),
                                    Text(
                                      "Delete  My Account",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: kWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 263,
                                      height: 94,
                                      child: Text(
                                        "Are you sure you want to delete your account?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: kWhiteWithOpacity,
                                                fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 263,
                                      height: 94,
                                      child: Text(
                                        "Please note that this process not reversible",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: kWhiteWithOpacity,
                                                fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                    ),
                                    ButtonWidget(
                                      onPressed: () {},
                                      buttonText: "No, Keep Account",
                                      height: 50,
                                      width: 347,
                                      buttonTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: kDarkBackGroundColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      buttonColor: kGreen,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Yes, Delete Account",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: kDarkRed,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  );
                })),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          isScrollControlled: true,
          isDismissible: false);
    }

    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Delete My Account",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            Text(
              "Why do you want to delete your account?",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16, color: kWhite),
            ),
            const SizedBox(
              height: 27,
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
                  showDeleteOptionDialog();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedOption ?? "Select an option",
                      style: TextStyle(
                          color: selectedOption == null
                              ? kWhiteWithOpacity
                              : kWhite,
                          fontSize: 18),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: kWhite),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            selectedOption == "Others"
                ? FormFieldWidget(
                    height: 170,
                    expands: false,
                    hintText: "State your reason",
                    maxLines: 20,
                  )
                : SizedBox(
                    height: 170,
                    child: Text(
                      "Lorem blan blah Ipsum blah",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kWhite, fontSize: 14),
                    ),
                  ),
            const SizedBox(
              height: 43,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  deleteAccountBottomSheet(context);
                },
                child: Text(
                  "Delete My Account",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kRed, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
