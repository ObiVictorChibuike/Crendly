import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/questionnaire/trust_questions/personality_questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalityQuestion extends StatefulWidget {
  const PersonalityQuestion({Key? key}) : super(key: key);

  @override
  State<PersonalityQuestion> createState() => _PersonalityQuestionState();
}

class _PersonalityQuestionState extends State<PersonalityQuestion> {
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
                    radius: 50, child: Icon(Icons.person, color: kWhite, size: 50,)
                ),
                const SizedBox(height: 40,),
                Text("Personality Question", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 20),),
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
