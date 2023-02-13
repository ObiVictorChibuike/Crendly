import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/update_regulatory_id/upload_id_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/flush_bar/flushbar_helper.dart';

class SelectedIDCard extends StatefulWidget {
  const SelectedIDCard({Key? key}) : super(key: key);

  @override
  _SelectedIDCardState createState() => _SelectedIDCardState();
}

class _SelectedIDCardState extends State<SelectedIDCard> {
  int type = 0;
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
                  "Select ID Card",
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AssetPath.id,
                        height: 200,
                        width: 300,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Choose your preferred ID",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Make sure the document includes a \npicture of your face. ",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                          )),
                      const SizedBox(
                        height: 34,
                      ),
                      CustomOutlineButton(
                        backGroundColor: type == 4 ? kDivider : null,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: kWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                        text: "International Passport",
                        height: 50,
                        color: Color(0xff2E4DBD),
                        buttonBorderRadius: 30,
                        onPressed: () {
                          setState(() {
                            debugPrint("type: $type");
                            type = 4;
                            controller.type = 4;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomOutlineButton(
                          backGroundColor: type == 2 ? kDivider : null,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                          text: "Drivers’ License",
                          height: 50,
                          color: Color(0xff2E4DBD),
                          buttonBorderRadius: 30,
                          onPressed: () {
                            setState(() {
                              type = 2;
                              controller.type = 2;
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomOutlineButton(
                          backGroundColor: type == 1 ? kDivider : null,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                          text: "National ID Card",
                          height: 50,
                          color: Color(0xff2E4DBD),
                          buttonBorderRadius: 30,
                          onPressed: () {
                            setState(() {
                              type = 1;
                              controller.type = 1;
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomOutlineButton(
                          backGroundColor: type == 3 ? kDivider : null,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                          text: "Voters Card",
                          height: 50,
                          color: Color(0xff2E4DBD),
                          buttonBorderRadius: 30,
                          onPressed: () {
                            setState(() {
                              type = 3;
                              controller.type = 3;
                            });
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonWidget(
                          buttonColor: kGreen,
                          onPressed: () {
                            if (controller.type == null) {
                              FlushBarHelper(context, "Please Choose your ID")
                                  .showErrorBar;
                            } else {
                              Get.to(() => const UploadIDCard());
                            }
                          },
                          buttonText: "Continue",
                          height: 50,
                          width: double.maxFinite),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
