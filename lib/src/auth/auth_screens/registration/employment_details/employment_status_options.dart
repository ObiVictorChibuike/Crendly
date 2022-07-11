import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/employed_option_screen.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/self_employed_option_screen.dart';
import 'package:crendly/src/auth/auth_screens/registration/employment_details/unemployed_option_screen.dart';
import 'package:crendly/src/auth/auth_screens/registration/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/customButton.dart';
import '../../../../../shared_widgets/cutom_appBar.dart';

class EmploymentStatusOptions extends StatefulWidget {
  const EmploymentStatusOptions({Key? key}) : super(key: key);

  @override
  _EmploymentStatusOptionsState createState() => _EmploymentStatusOptionsState();
}

class _EmploymentStatusOptionsState extends State<EmploymentStatusOptions> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          flexibleSpace: const Padding(padding: EdgeInsets.only(top: 35.0, bottom: 10), child: LinearProgressIndicator(color: kGreen, value: 0.5,),),
          title: Text("Employment Status", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: (){
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 75, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerLeft,
                  child: Text("What is your employment status?",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
              const SizedBox(height: 10,),
              CustomOutlineButton(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite,fontSize: 16, fontWeight: FontWeight.bold,),
                  text: "Employed", height: 55, color: Color(0xff2E4DBD), buttonBorderRadius: 30,
                  onPressed: (){
                    Get.to(()=> const EmployedOptionScreen());
                  }
              ),
              const SizedBox(height: 10,),
              CustomOutlineButton(
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite,fontSize: 16, fontWeight: FontWeight.bold,),
                  text: "Self- Employed", height: 55, color: Color(0xff2E4DBD), buttonBorderRadius: 30,
                  onPressed: (){
                  Get.to(()=> const SelfEmployedOptionScreen());
                  }
              ),
              const SizedBox(height: 10,),
              CustomOutlineButton(
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite,fontSize: 16, fontWeight: FontWeight.bold,),
                  text: "Unemployed", height: 55, color: Color(0xff2E4DBD), buttonBorderRadius: 30,
                  onPressed: (){
                    Get.to(()=> const UnemployedOptionScreen());
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
