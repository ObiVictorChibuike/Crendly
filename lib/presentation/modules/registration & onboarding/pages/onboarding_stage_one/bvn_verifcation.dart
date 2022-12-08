import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/utils/mixin/form_mixin.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/onboarding_stage_one/dob_and_gender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BVNVerification extends StatefulWidget {
  const BVNVerification({Key? key}) : super(key: key);

  @override
  _BVNVerificationState createState() => _BVNVerificationState();
}

class _BVNVerificationState extends State<BVNVerification> with FormMixin{
  //Keys
  final scaffoldKey = GlobalKey <ScaffoldState>();
  final formKey = GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: RegistrationController(),
        builder: (controller){
      return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            centerTitle: false, bottomPadding: 0,
            title: LinearProgressIndicator(
              color: kGreen,
              value: 0.1,
            ),
            appBarLabel: Text("BVN", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Provide your BVN",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  FormFieldWidget(
                    controller: controller.bvnController,
                    expands: false,
                    labelText: "Enter BVN",
                    keyboardType: TextInputType.number,
                    validator: isBvn,
                  ),
                  const SizedBox(height: 125,),
                  ButtonWidget(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          Get.to(() => const DateOfBirthAndGender());
                        }
                      },
                      buttonColor: kGreen,
                      buttonText: "Next",
                      height: 50,
                      width: double.maxFinite),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(alignment: Alignment.center,
                    child: Text(
                      "Can’t get your BVN? Dial *565*0#",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite, fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 142,
                  ),
                  Align(alignment: Alignment.center,
                    child: Text(
                      "Don’t have a BVN at the moment? ",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Align(alignment: Alignment.center,
                    child: Text(
                      'Continue without BVN',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
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
