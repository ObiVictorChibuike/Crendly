import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../../../constants/asset_path.dart';

class ContactAddress extends StatefulWidget {
  const ContactAddress({Key? key}) : super(key: key);

  @override
  State<ContactAddress> createState() => _ContactAddressState();
}

class _ContactAddressState extends State<ContactAddress> {
  String? selectedArea;
  String? selectedLocationDescription;
  bool? isLocationDescriptionSelected = false;
  List<String> area = [
    "Area 1",
    "Area 2",
    "Area 3",
    "Area 4",
    "Area 5",
    "Area 6",
    "Area 7",
    "Area 8"
  ];
  List<String> locationDescription = [
    "Owner",
    "Shared Ownership",
    "Rented",
    "Shared Rented",
    "Living with family or friend",
  ];
  showAreaDialog() {
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
                    area.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedArea = area[index];
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
                                    area[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            color: kWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                  ),
                                  selectedArea == area[index]
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

  showLocationDescriptionDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 3.3,
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
                    locationDescription.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedLocationDescription =
                                locationDescription[index];
                            isLocationDescriptionSelected = true;
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
                                    locationDescription[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            color: kWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                  ),
                                  selectedLocationDescription ==
                                          locationDescription[index]
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
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          centerTitle: true,
          title: Text(
            "Contact Address",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
          ),
          decorationImagePath: AssetPath.fullTag,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 35.0, 24.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FormFieldWidget(
                              labelTitle: "Residence",
                              width: MediaQuery.of(context).size.width / 2.5,
                              hintText: "No 23",
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                FormFieldWidget(
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  hintText: "Apartment 6",
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldWidget(
                      labelTitle: "Area or Road Name",
                      hintText: "Street Name",
                    ),
                    FormFieldWidget(
                      hintText: "Nearest Bus Stop/ Landmark",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LGA",
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
                            Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kWhite, width: 0.7),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.transparent)),
                                onPressed: () {
                                  showAreaDialog();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedArea ?? "Select",
                                      style: TextStyle(
                                          color: selectedArea == null
                                              ? const Color(0xff868484)
                                              : kWhite,
                                          fontSize: 18),
                                    ),
                                    const Icon(Icons.keyboard_arrow_down,
                                        color: kWhite)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "State",
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
                            Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kWhite, width: 0.7),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.transparent)),
                                onPressed: () {
                                  showAreaDialog();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedArea ?? "Select",
                                      style: TextStyle(
                                          color: selectedArea == null
                                              ? const Color(0xff868484)
                                              : kWhite,
                                          fontSize: 18),
                                    ),
                                    const Icon(Icons.keyboard_arrow_down,
                                        color: kWhite)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
