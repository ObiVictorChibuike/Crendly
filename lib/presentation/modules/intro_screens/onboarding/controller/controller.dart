import 'package:crendly/app/constants/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  List<Widget> onBoardingScreens = DummyData.onBoardingViews;
  final controller = PageController();
  String text = 'Later';


  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      if (controller.page == 0) {
          text = 'Later';
          update();
      }else if(controller.page == 1){
          text = 'Back';
          update();
      }
    });
  }


}