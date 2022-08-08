import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/questionnaire/trust_questions/personality_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MoveToPersonalityQuestion extends StatefulWidget {
  const MoveToPersonalityQuestion({Key? key}) : super(key: key);

  @override
  State<MoveToPersonalityQuestion> createState() => _MoveToPersonalityQuestionState();
}

class _MoveToPersonalityQuestionState extends State<MoveToPersonalityQuestion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(backgroundColor: kDarkBackGroundColor, elevation: 0.0,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          ),
          backgroundColor: kDarkBackGroundColor,
          body: Align(alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: kBlue,
                    radius: 50, child: SvgPicture.asset(AssetPath.starredPerson),
                ),
                const SizedBox(height: 40,),
                Text("Personality Question", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 20),),
                const SizedBox(height: 10,),
                Text("Let’s know the kind of person you are. ", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 14),),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ButtonWidget(onPressed: (){
                    Get.to(()=>const PersonalityQuestionsScreen());
                  }, buttonText: "Let’s start", buttonColor: kGreen,
                      height: 55, width: double.maxFinite),
                )
              ],
            ),
          )
        )
    );
  }
}
