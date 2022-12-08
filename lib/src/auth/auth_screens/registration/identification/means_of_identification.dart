import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/auth/auth_screens/registration/identification/select_id_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MeansOfIdentification extends StatefulWidget {
  const MeansOfIdentification({Key? key}) : super(key: key);

  @override
  _MeansOfIdentificationState createState() => _MeansOfIdentificationState();
}

class _MeansOfIdentificationState extends State<MeansOfIdentification> {
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
          ), centerTitle: false,
          appBarLabel: Text(
            "Means Of Identification",
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
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
                    "Let’s be sure you’re human.",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
                    "Please prepare one of the following documents: ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Passport  .  Driver’s Liscence  .  NIN  .  Voters’ Card",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )),
              const Spacer(
                flex: 3,
              ),
              ButtonWidget(
                  buttonColor: kGreen,
                  onPressed: () {
                    Get.to(() => const SelectedIDCard());
                  },
                  buttonText: "Continue",
                  height: 50,
                  width: double.maxFinite),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Don’t have it on me right now, ",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
