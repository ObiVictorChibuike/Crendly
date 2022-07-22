import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/personality_question.dart';
import 'package:crendly/src/questionnaire/trust_questions/personality_questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileDetails extends StatefulWidget {
  const CompleteProfileDetails({Key? key}) : super(key: key);

  @override
  State<CompleteProfileDetails> createState() => _CompleteProfileDetailsState();
}

class _CompleteProfileDetailsState extends State<CompleteProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(
          centerTitle: true, backgroundColor: kDarkBackGroundColor, elevation: 0.0,
          title: Text("Complete your profile details", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,) ,)
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 24, right: 24),
          child: Column(
            children: [
              Text("Kindly update your details and any other \ninformation required to proceed with your \nloan application.",textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 14),),
              const SizedBox(height: 30,),
              Container(
                height: 80, width: double.maxFinite,
                padding: EdgeInsets.all(25), decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(4)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Trust Question", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),),
                        Text("Et, at interdum pretium vitae. ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ],
                )
              ),
              const SizedBox(height: 40,),
              Container(
                  height: 80, width: double.maxFinite,
                  padding: EdgeInsets.all(25), decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(4)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Trust Question", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),),
                          Text("Et, at interdum pretium vitae. ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ],
                  )
              ),
              const Spacer(flex: 6,),
              ButtonWidget(
                  onPressed: (){
                    Get.to(()=> const PersonalityQuestion());
                  },
                  buttonText: "Continue",  buttonColor: kGreen,
                  height: 50, width: double.maxFinite
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
