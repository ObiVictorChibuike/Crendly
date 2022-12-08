import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/auth/auth_screens/registration/verify_address/address_verification.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadIDCard extends StatefulWidget {
  const UploadIDCard({Key? key}) : super(key: key);

  @override
  _UploadIDCardState createState() => _UploadIDCardState();
}

class _UploadIDCardState extends State<UploadIDCard> {
  void showScanOptionBottomSheet(BuildContext context) {
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height / 3,
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
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        hasSelected = true;
                      });
                      Get.back();
                    },
                    child: Container(height: 80, width: 80,
                      decoration: BoxDecoration(color: Color(0xff2E4DBD),),
                      child: Padding(padding: const EdgeInsets.all(25.0),
                        child: SvgPicture.asset(AssetPath.scanPicture, height: 50, width: 50,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text("Scan ID Card",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 14),
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
                      setState(() {
                        hasSelected = true;
                      });
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

  bool hasSelected = false;

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
            value: 0.5,
          ),
          appBarLabel: Text(
            "Select ID Card",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
          ), centerTitle: false,
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SvgPicture.asset(
                                  AssetPath.id,
                                  height: 180,
                                  width: 280,
                                )),
                            TextButton(
                                onPressed: () {
                                  showScanOptionBottomSheet(context);
                                },
                                child: Text(
                                  "Upload ID Card",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          color: kGreen,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w700),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    hasSelected == true
                        ? Text(
                            " ID Number",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: kWhite),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    hasSelected == true
                        ? FormFieldWidget(
                            hintText: "43251252547",
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 30,
                    ),
                    hasSelected == true
                        ? Row(
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
                                        "Issue date",
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
                                        width: MediaQuery.of(context).size.width /
                                            2.5,
                                        hintText: "DD/MM/YY",
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expiry date",
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
                                        width: MediaQuery.of(context).size.width /
                                            2.5,
                                        hintText: "DD/MM/YY",
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(height: 50,),
                    hasSelected == true
                        ? ButtonWidget(
                            onPressed: () {
                              showMyDialog();
                            },
                            buttonText: "Continue",
                            height: 50,
                            buttonColor: kGreen,
                            width: double.maxFinite)
                        : const SizedBox(),
                    const SizedBox(height: 50,),
                    hasSelected == true
                        ? Align(
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
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline),
                                )))
                        : const SizedBox(),
                    const SizedBox(height: 50,)
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
