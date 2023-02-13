import 'dart:io';

import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../app/shared_widgets/customButton.dart';
import '../../../../../app/shared_widgets/custom_form_field_widget.dart';
import '../../../../../app/utils/flush_bar/flushbar_helper.dart';
import '../../../../../app/utils/loader/progress_loader.dart';
import '../../../../../core/state/view_state.dart';
import '../../controller/controller/controller.dart';
import '../verify_address/address_verification.dart';

class UploadIDCard extends StatefulWidget {
  const UploadIDCard({Key? key}) : super(key: key);

  @override
  _UploadIDCardState createState() => _UploadIDCardState();
}

class _UploadIDCardState extends State<UploadIDCard> {
  bool hasSelected = false;
  File? imageFile;
  ImagePicker _imagePicker = ImagePicker();
  _selectIssueDate(
      BuildContext context, RegistrationController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      helpText: 'SELECT ISSUE DATE',
      confirmText: 'SELECT',
    );
    if (picked != null) {
      setState(() {
        var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
        var inputDate = inputFormat.parse(picked.toString());
        var outputFormat = DateFormat('dd/MM/yyyy');
        controller.issueDateController.text = outputFormat.format(inputDate);
        print(controller.dateOfBirth.text);
      });
    }
  }

  _selectExpiryDate(
      BuildContext context, RegistrationController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      helpText: 'SELECT EXPIRY DATE',
      confirmText: 'SELECT',
    );
    if (picked != null) {
      setState(() {
        var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
        var inputDate = inputFormat.parse(picked.toString());
        var outputFormat = DateFormat('dd/MM/yyyy');
        controller.expiryDateController.text = outputFormat.format(inputDate);
        print(controller.dateOfBirth.text);
      });
    }
  }

  void updateRegulatoryId(
      BuildContext context, RegistrationController controller) async {
    ShowProgressDialog().show;
    if (imageFile != null) {
      await controller.updateUserRegulatoryId(imageFile!.path);
      if (controller.updateRegulatoryIdState.state == ResponseState.COMPLETE) {
        ShowProgressDialog().hide;
        Get.to(showMyDialog());
      } else if (controller.updateRegulatoryIdState.state ==
          ResponseState.ERROR) {
        ShowProgressDialog().hide;
        FlushBarHelper(context, controller.errorMessage).showErrorBar;
      }
    } else {
      FlushBarHelper(context, "Please take a picture or upload id ")
          .showErrorBar;
    }
  }

  void showScanOptionBottomSheet(
      BuildContext context, RegistrationController controller) {
    MyBottomSheet().showNonDismissibleBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height / 3,
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
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      pickImage(ImageSource.camera, controller);
                      Get.back();
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff2E4DBD),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SvgPicture.asset(
                          AssetPath.scanPicture,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Scan ID Card",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      pickImage(ImageSource.gallery, controller);
                      Get.back();
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff2E4DBD),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SvgPicture.asset(
                          AssetPath.fileUpload,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "From File",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              ),
            ],
          )
        ]);
  }

  showMyDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(
              flex: 3,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kGreen, width: 2),
                    color: const Color(0xff081952)),
                child: const Center(
                    child: Icon(
                  Icons.person,
                  color: kOrange,
                  size: 35,
                )),
              ),
            ),
            Container(
              height: 60,
              width: 2,
              color: kGreen,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "We’ll have our AI system \nverify your ID in a bit",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 2,
              color: kGreen,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: CustomOutlineButton(
                  backGroundColor: const Color(0xff081952),
                  color: kGreen,
                  text: "Ok",
                  height: 50,
                  onPressed: () {
                    Get.back();
                    Get.to(() => AddressVerification());
                  }),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      )
    ]);
  }

  pickImage(ImageSource imageSource, RegistrationController controller) async {
    final image = await _imagePicker.pickImage(source: imageSource);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
        hasSelected = true;
      });
    } else {
      throw Exception("Image is null");
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
                title: LinearProgressIndicator(
                  color: kGreen,
                  value: 0.5,
                ),
                appBarLabel: Text(
                  "Select ID Card",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                centerTitle: false,
                decorationImagePath: AssetPath.pngLemonHead,
                onBackPressed: () {
                  Get.back();
                },
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 35, left: 6, right: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: !hasSelected
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      DottedBorder(
                                          color: Color(0xffC1CDF6),
                                          dashPattern: [8, 4],
                                          radius: Radius.circular(10),
                                          borderType: BorderType.RRect,
                                          child: Column(
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20.0),
                                                  child: SvgPicture.asset(
                                                    AssetPath.id,
                                                    height: 180,
                                                    width: 280,
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    showScanOptionBottomSheet(
                                                        context, controller);
                                                  },
                                                  child: Text(
                                                    "Upload ID Card",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        ?.copyWith(
                                                            color: kGreen,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: DottedBorder(
                                            color: Color(0xffC1CDF6),
                                            dashPattern: [8, 4],
                                            radius: Radius.circular(10),
                                            borderType: BorderType.RRect,
                                            child: Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24,
                                                        vertical: 12),
                                                child: Image.file(
                                                  imageFile!,
                                                  fit: BoxFit.fill,
                                                  width: double.infinity,
                                                ))),
                                      ),
                                      const SizedBox(
                                        height: 37,
                                      ),
                                      Text(
                                        " ID Number",
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
                                        hintText: "43251252547",
                                        controller:
                                            controller.idNumberController,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Issue date",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        color: kWhite,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: FormFieldWidget(
                                                  expands: false,
                                                  hintText: "DD/MM/YY",
                                                  onTap: () {
                                                    _selectIssueDate(
                                                        context, controller);
                                                  },
                                                  controller: controller
                                                      .issueDateController,
                                                  suffixIcon: Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    color: kWhite,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                              //
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Expiry date",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        color: kWhite,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Expanded(
                                                  child: FormFieldWidget(
                                                    expands: false,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    hintText: "DD/MM/YY",
                                                    onTap: () {
                                                      _selectExpiryDate(
                                                          context, controller);
                                                    },
                                                    controller: controller
                                                        .expiryDateController,
                                                    suffixIcon: Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color: kWhite,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      ButtonWidget(
                                          onPressed: () {
                                            updateRegulatoryId(
                                                context, controller);
                                          },
                                          buttonText: "Continue",
                                          height: 50,
                                          buttonColor: kGreen,
                                          width: double.maxFinite),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Provide a Different ID card",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        color: kGreen,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                              )))
                                    ],
                                  )))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
