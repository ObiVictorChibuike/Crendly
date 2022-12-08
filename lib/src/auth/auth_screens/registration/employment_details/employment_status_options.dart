import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/employed_option_screen.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/self_employed_option_screen.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/unemployed_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmploymentStatusOptions extends StatefulWidget {
  const EmploymentStatusOptions({Key? key}) : super(key: key);

  @override
  _EmploymentStatusOptionsState createState() =>
      _EmploymentStatusOptionsState();
}

class _EmploymentStatusOptionsState extends State<EmploymentStatusOptions> {
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
          ),centerTitle: false,
          appBarLabel: Text(
            "Employment Status",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What is your employment status?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomOutlineButton(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  text: "Employed",
                  height: 50,
                  color: Color(0xff2E4DBD),
                  buttonBorderRadius: 30,
                  onPressed: () {
                    Get.to(() => const EmployedOptionScreen());
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomOutlineButton(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  text: "Self- Employed",
                  height: 50,
                  color: Color(0xff2E4DBD),
                  buttonBorderRadius: 30,
                  onPressed: () {
                    Get.to(() => const SelfEmployedOptionScreen());
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomOutlineButton(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  text: "Unemployed",
                  height: 50,
                  color: Color(0xff2E4DBD),
                  buttonBorderRadius: 30,
                  onPressed: () {
                    Get.to(() => const UnemployedOptionScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
