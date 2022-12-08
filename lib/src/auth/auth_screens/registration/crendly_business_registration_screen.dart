import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrendlyBusinessOption extends StatefulWidget {
  const CrendlyBusinessOption({Key? key}) : super(key: key);

  @override
  _CrendlyBusinessOptionState createState() => _CrendlyBusinessOptionState();
}

class _CrendlyBusinessOptionState extends State<CrendlyBusinessOption> {
  void dialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
      Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
            const Spacer(flex: 3,),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kGreen, width: 3),
                  color: const Color(0xff081952)),
              child: const Center(
                  child: Icon(
                Icons.phone_android_rounded,
                color: kOrange,
                size: 20,
              )),
            ),
          ),
          Container(
            height: 55,
            width: 3,
            color: kGreen,
          ),
          const Spacer(),
          Text(
            "Thank you for joining the \nCrendly business waitlist.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Spacer(),
          Text(
            "We will keep in touch and let you \nknow the latest development on \nCrendly Business.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ))
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
          title: Text(
            "Crendly for business",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          decorationImagePath: AssetPath.fullTag,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                      "For businesses that want fair loans to power their ideas, we are designing a solution with you in mind.\n\n\n"
                      "Join the wait list to be the first to know when Crendly for Business is ready.",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  const Spacer(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Business email address",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const FormFieldWidget(
                    hintText: "newmail@mail.com",
                  ),
                  const Spacer(),
                  ButtonWidget(
                      onPressed: () {
                        dialog();
                      },
                      buttonColor: kGreen,
                      buttonText: "Join waitlist",
                      height: 55,
                      width: double.maxFinite),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
