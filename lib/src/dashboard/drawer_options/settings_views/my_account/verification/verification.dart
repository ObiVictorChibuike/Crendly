import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        appBarLabel: Text(
          "Verification",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              FormFieldWidget(
                hintText: '222333******',
                labelTitle: "BVN",
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: kGreen,
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: kDarkBackGroundColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Text(
                "Employment & Education",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 20, color: kWhite),
              ),
              const SizedBox(
                height: 11,
              ),
              FormFieldWidget(
                labelTitle: "Employer's name",
                hintText: 'Johnson & Sons Limited',
                labelTitleTextStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 14, color: kWhite),
              ),
              const SizedBox(
                height: 16,
              ),
              FormFieldWidget(
                labelTitle: "Occupation",
                hintText: 'Sales Personnel',
                labelTitleTextStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 14, color: kWhite),
              ),
              const SizedBox(
                height: 16,
              ),
              FormFieldWidget(
                labelTitle: "What is your position at your company?",
                hintText: 'Manager',
                labelTitleTextStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 14, color: kWhite),
              ),
              const SizedBox(
                height: 16,
              ),
              FormFieldWidget(
                labelTitle: "What is your type of employment?",
                hintText: 'Full time',
                labelTitleTextStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 14, color: kWhite),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "What is your Salary range?",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(color: kWhite, width: 0.7),
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {
                    //  showAreaDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "N50,000 - N1,000,000",
                        style: TextStyle(color: kWhite, fontSize: 18),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: kWhite)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 190,)
            ],
          ),
        ),
      ),
    );
  }
}
