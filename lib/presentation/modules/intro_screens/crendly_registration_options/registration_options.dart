import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/auth/auth_screens/registration/crendly_business_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../registration & onboarding/pages/verify_address/address_verification.dart';

class SignUpOption extends StatelessWidget {
  const SignUpOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void chooseOption(int index) {
      index == 0
          ? Get.to(AddressVerification())
          //Get.to(() => const BVNVerification())
          : Get.to(() => const CrendlyBusinessOption());
    }

    List options = DummyData.signUpOptions;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          height: 108,
          backgroundColor: kDarkBackGroundColor,
          decorationImagePath: AssetPath.fullTag,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "We are about the credibility of our platform. \nHence, you will "
                  "be asked a series of questions to \nonboard Crendly. Please be "
                  "patient and get all \nyour details handy. ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 12, color: kWhite),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 1.2,
                        minHeight: 50),
                    child: Text(
                      'Which one of these options best describes you?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 24,
                          color: kOrange,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 47,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(options.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              chooseOption(index);
                              //Get.toNamed('/bvn');
                            },
                            child: Container(
                              height: 248,
                              width: MediaQuery.of(context).size.width / 2.4,
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 19.0, 15.0, 20.0),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: options[index]["color"]),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kDarkBackGroundColor),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                options[index]["asset"],
                                                height: 60,
                                                width: 60,
                                                theme: const SvgTheme(
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2,
                                                  minHeight: 30),
                                              child: Text(
                                                options[index]["title"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              )),
                                          ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2,
                                                  minHeight: 50),
                                              child: Text(
                                                options[index]["description"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Either way, we’ll be having a good \ntime together.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400, color: kWhite),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text('Don’t want to sign up now',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: kGreen,
                        decoration: TextDecoration.underline)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
