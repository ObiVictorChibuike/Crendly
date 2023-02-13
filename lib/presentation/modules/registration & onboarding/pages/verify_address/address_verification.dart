import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../../../../app/shared_widgets/customButton.dart';

class AddressVerification extends StatefulWidget {
  const AddressVerification({Key? key}) : super(key: key);

  @override
  State<AddressVerification> createState() => _AddressVerificationState();
}

class _AddressVerificationState extends State<AddressVerification> {
  final _controller = Get.put(RegistrationController());
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

  showAreaDialog(RegistrationController controller) {
    //  List<String> residenceArea = controller.areas ?? [];
    // debugPrint("Residence Area $residenceArea");
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
                  _controller.areas == null ||
                          _controller.areas!.isEmpty ||
                          _controller.areas == []
                      ? const Text("Empty List")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: _controller.areas!.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    // selectedArea = residenceArea[index];
                                    Get.back();
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _controller.areas![index].area
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              ?.copyWith(
                                                  color: kWhite,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                        ),
                                        // selectedArea == residenceArea[index]
                                        //      ? const Icon(
                                        //          Icons.check,
                                        //          size: 12,
                                        //          color: kOrange,
                                        //        )
                                        //      : const SizedBox()
                                      ],
                                    ),
                                    const Divider(
                                      color: kLighterBackGroundColor,
                                    )
                                  ],
                                ),
                              ))
                  // ...List.generate(
                  //   residenceArea.length,
                  //   (index) {
                  //     return InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           selectedArea = area[index];
                  //           Get.back();
                  //         });
                  //       },
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(bottom: 10, top: 10),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   residenceArea[index],
                  //                   style: Theme.of(context)
                  //                       .textTheme
                  //                       .bodyText2
                  //                       ?.copyWith(
                  //                           color: kWhite,
                  //                           fontWeight: FontWeight.w400,
                  //                           fontSize: 16),
                  //                 ),
                  //                 selectedArea == area[index]
                  //                     ? const Icon(
                  //                         Icons.check,
                  //                         size: 12,
                  //                         color: kOrange,
                  //                       )
                  //                     : const SizedBox()
                  //               ],
                  //             ),
                  //             const Divider(
                  //               color: kLighterBackGroundColor,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // )
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
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: kDarkBackGroundColor,
              appBar: CustomAppbar(
                title: LinearProgressIndicator(
                  color: kGreen,
                  value: 0.5,
                ),
                centerTitle: false,
                appBarLabel: Text(
                  "Let’s verify your \naddress too.",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                decorationImagePath: AssetPath.pngLemonHead,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Residence",
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
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: FormFieldWidget(
                                          expands: false,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          hintText: "House Number",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text("Expiry Date", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        child: FormFieldWidget(
                                          expands: false,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          hintText: "Apartment No",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Area or Road Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: kWhite),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormFieldWidget(
                            expands: false,
                            hintText: "Street Name",
                          ),
                          const SizedBox(
                            height: 42,
                          ),
                          Container(
                            height: 55,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                border: Border.all(color: kWhite, width: 0.7),
                                borderRadius: BorderRadius.circular(8)),
                            child: TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.transparent)),
                              onPressed: () {
                                showAreaDialog(controller);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectedArea ??
                                          "Area that best describes your location",
                                      style: TextStyle(
                                        color: selectedArea == null
                                            ? const Color(0xff868484)
                                            : kWhite,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down,
                                      color: kWhite)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 42,
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
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kWhite, width: 0.7),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      Colors.transparent)),
                                      onPressed: () {
                                        showAreaDialog(controller);
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
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kWhite, width: 0.7),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      Colors.transparent)),
                                      onPressed: () {
                                        showAreaDialog(controller);
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
                          const SizedBox(
                            height: 42,
                          ),
                          Text(
                            "Specify the type of residence holding at your address.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 55,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                border: Border.all(color: kWhite, width: 0.7),
                                borderRadius: BorderRadius.circular(8)),
                            child: TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.transparent)),
                              onPressed: () {
                                showLocationDescriptionDialog();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedLocationDescription ??
                                        "Area that best describes your location",
                                    style: TextStyle(
                                        color: selectedArea == null
                                            ? const Color(0xff868484)
                                            : kWhite,
                                        fontSize: 14),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down,
                                      color: kWhite)
                                ],
                              ),
                            ),
                          ),
                          isLocationDescriptionSelected == true
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 26,
                                    ),
                                    const Divider(
                                      color: kLightBackGroundColor,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "How long have you lived in your current resident?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: kWhite,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GroupButton(
                                      options: GroupButtonOptions(
                                          selectedTextStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              ?.copyWith(
                                                  color: kWhite, fontSize: 16),
                                          unselectedTextStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              ?.copyWith(
                                                  color: kWhite, fontSize: 16),
                                          unselectedColor: Colors.transparent,
                                          mainGroupAlignment:
                                              MainGroupAlignment.start,
                                          unselectedBorderColor: kWhite,
                                          crossGroupAlignment:
                                              CrossGroupAlignment.start,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          selectedColor:
                                              const Color(0xff8095E0),
                                          buttonHeight: 50,
                                          buttonWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5),
                                      isRadio: false,
                                      onSelected:
                                          (String value, index, isSelected) {},
                                      buttons: [
                                        "Less than 2 years",
                                        "2 - 4 years",
                                        "More than 4 years"
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 50,
                          ),
                          ButtonWidget(
                              onPressed: () {
                                controller.getResidenceCategories();
                                //Get.to(() => const FaceScanAuth());
                              },
                              buttonColor: kGreen,
                              buttonText: "Continue",
                              height: 50,
                              width: double.maxFinite),
                          const SizedBox(
                            height: 50,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
