import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/controller/home_section_controller.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/questionnaire/add_card/add_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileDetails extends StatefulWidget {
  const CompleteProfileDetails({Key? key}) : super(key: key);

  @override
  State<CompleteProfileDetails> createState() => _CompleteProfileDetailsState();
}

class _CompleteProfileDetailsState extends State<CompleteProfileDetails> {
  final _controller = Get.put(HomeSectionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSectionController>(
      init: HomeSectionController(),
        builder: (controller){
      return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
              centerTitle: true, backgroundColor: kDarkBackGroundColor, elevation: 0.0,
              title: Text("Complete your profile details", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              leading: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,))
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 24, right: 24),
            child: Column(
              children: [
                Text("Kindly update your details and any other \ninformation required to proceed with your \nloan application.",textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 14),),
                const SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    _controller.navigateToTrustQuestion();
                  },
                  child: Container(
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
                          Container(height: 18, width: 18,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: _controller.isFirstOptionSelected == false ? const Color(0xff00071F) : kGreen),
                            child: Icon(Icons.check, size: 12, color: _controller.isFirstOptionSelected == false ? Color(0xff0930B6) : kWhite),
                          )
                        ],
                      )
                  ),
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                   _controller.navigateToPersonalityQuestion();
                  },
                  child: Container(
                      height: 80, width: double.maxFinite,
                      padding: EdgeInsets.all(25), decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(4)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Personality Question", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),),
                              Text("Et, at interdum pretium vitae. ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Container(height: 18, width: 18,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: _controller.isSecondOptionSelected == false ? const Color(0xff00071F) : kGreen),
                            child: Icon(Icons.check, size: 12, color: _controller.isSecondOptionSelected == false ? Color(0xff0930B6) : kWhite,),
                          )
                        ],
                      )
                  ),
                ),
                const Spacer(flex: 6,),
                ButtonWidget(
                    onPressed: (){
                      _controller.isSecondOptionSelected == false || _controller.isFirstOptionSelected == false ? null : Get.to(()=> const AddCardScreen());
                    },
                    buttonText: "Continue",  buttonColor: _controller.isSecondOptionSelected == false || _controller.isFirstOptionSelected == false ?  Color(0xff383838) : kGreen,
                    height: 50, width: double.maxFinite
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
