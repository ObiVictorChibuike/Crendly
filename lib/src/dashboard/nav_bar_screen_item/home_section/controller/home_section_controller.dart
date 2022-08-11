import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/move_to_personality_question.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/move_to_trust_question.dart';
import 'package:get/get.dart';


class HomeSectionController extends GetxController{
  bool? isFirstOptionSelected = false;
  bool? isSecondOptionSelected = false;

  navigateToTrustQuestion(){
    isFirstOptionSelected = true;
    update();
    Get.to(()=> const MoveToTrustQuestion());
  }
  navigateToPersonalityQuestion(){
      isSecondOptionSelected = true;
      update();
      Get.to(()=> MoveToPersonalityQuestion());
  }
}