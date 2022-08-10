import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../shared_widgets/customButton.dart';
import '../../../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../complete_profile_details.dart';

class PersonalityQuestionsScreen extends StatefulWidget {
  const PersonalityQuestionsScreen({Key? key}) : super(key: key);

  @override
  _PersonalityQuestionsScreenState createState() =>
      _PersonalityQuestionsScreenState();
}

class _PersonalityQuestionsScreenState
    extends State<PersonalityQuestionsScreen> {
  final _controller = PageController();
  String text = '';

  void secondQuestionSetDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 2,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(height: 75, width: 75,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 3), color: const Color(0xff081952)),
                      child: Center(child: SvgPicture.asset(AssetPath.alertIcon)),
                    ),
                  ),
                  Container(height: 40, width: 3, color: kGreen,),
                  const Spacer(),
                  Text("You won't be able to access a loan \nwithout completing the questionnaire.", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                  const Spacer(flex: 4,),
                  Text("Do you still want to continue later?",
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),),
                  const Spacer(flex: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){

                        }, child: Text("Yes, Do it Later", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Color(0xffFF3A5A), fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)),
                        ButtonWidget(onPressed: (){}, buttonText: "No, Keep going", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                          height: 50, width: MediaQuery.of(context).size.width / 2.8, buttonColor: kGreen,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3,),
                ],
              ))
        ]);
  }

  void firstQuestionSetDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 2,),
                  Align(alignment: Alignment.centerRight,
                    child: IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(height: 75, width: 75,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 3), color: const Color(0xff081952)),
                      child: Center(child: SvgPicture.asset(AssetPath.starredPerson)),
                    ),
                  ),
                  Container(height: 40, width: 3, color: kGreen,),
                  const Spacer(),
                  Text(_controller.page == 4 ? "Wow.  1 of 4 Personality \nquestion completed. Let’s go" : _controller.page == 9 ?
                  "Wow.  2 of 4 Personality \nquestion completed. Let’s go" : _controller.page == 14 ? "Wow.  3 of 4 Personality \nquestion completed. Let’s go" :
                  _controller.page == 19 ? "Wow.  4 of 4 Personality \nquestion completed. Let’s go" : "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
                  const Spacer(),
                  Text("You have 3 more personality tests \nto go and they will only take a few \nminutes to complete.",
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const Spacer(flex: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Get.back();
                          secondQuestionSetDialog();
                        }, child: Text("Continue Later", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)),
                        ButtonWidget(onPressed: (){
                          Get.back();
                          _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                          count();
                        }, buttonText: "Continue", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                          height: 50, width: MediaQuery.of(context).size.width / 3.2, buttonColor: kGreen,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3,),
                ],
              ))
        ]);
  }

  void questionsCompleted() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 2,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(height: 75, width: 75,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 3), color: const Color(0xff081952)),
                      child: Center(child: SvgPicture.asset(AssetPath.starredPerson)),
                    ),
                  ),
                  Container(height: 40, width: 3, color: kGreen,),
                  const Spacer(),
                  Text("Personality questions \ncompleted",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
                  const Spacer(),
                  Text("You have successfully completed \nthe personality questions.",
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const Spacer(flex: 3,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                    child:  ButtonWidget(onPressed: (){
                      Get.to(()=> const CompleteProfileDetails());
                    }, buttonText: "Continue", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                      height: 50, width: double.maxFinite, buttonColor: kGreen,
                    ),
                  ),
                  const Spacer(flex: 3,),
                ],
              ))
        ]);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 0) {
        setState(() {
          text = '';
        });
      } else if (_controller.page == 1) {
        setState(() {
          text = 'Back';
        });
      }
    });
  }

  count(){
    if(_controller.page == 4){
      setState(() {
        actionText = "2 of 4";
      });
    } else if(_controller.page == 9){
      setState(() {
        actionText = "3 of 4";
      });
    } else if(_controller.page == 14){
      setState(() {
        actionText = "4 of 4";
      });
    }
  }

  void next() {
    if (_controller.page == 4 || _controller.page == 9 || _controller.page == 14) {
      firstQuestionSetDialog();
    } else if(_controller.page == 19){
      questionsCompleted();
    } else{
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.page == 1) {
      Get.to(() => const CompleteProfileDetails());
    }
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  String actionText = "1 of 4";


  List<Widget> personalityQuestionsViews = DummyData.personalityQuestionsViews;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            actionWidget: Text(actionText,style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: kWhite),),
            title: LinearProgressIndicator(
              color: kGreen,
              value: 1,
              valueColor: const AlwaysStoppedAnimation(kGreen),
            ),
            appBarLabel: Text("Personality Question", style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: personalityQuestionsViews,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: previous,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 67),
                        child: Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 67),
                      child: ButtonWidget(
                          onPressed: () {
                            next();
                          },
                          buttonColor: kGreen,
                          buttonText: "Next",
                          borderRadius: 8,
                          height: 50,
                          width: 133),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
