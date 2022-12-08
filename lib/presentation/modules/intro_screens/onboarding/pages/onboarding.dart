import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/presentation/modules/intro_screens/onboarding/controller/controller.dart';
import 'package:crendly/presentation/modules/intro_screens/onboarding/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({Key? key}) : super(key: key);

  @override
  _MainOnBoardingScreenState createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  final _controller = Get.put(OnBoardingController());

  void next() {
    if (_controller.controller.page == 2) {
      Get.to(()=> const LandingPage());
    } else {
      _controller.controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.controller.page == 0) {
      Get.to(()=> const LandingPage());
    }
    _controller.controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn,);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (controller){
      return SafeArea(top: false, bottom: false,
        child: Scaffold(backgroundColor: kDarkBackGroundColor,
            body: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.controller,
                    children:  _controller.onBoardingScreens,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: previous,
                      child: Container(
                        margin: const EdgeInsets.only(left: 33, bottom: 80),
                        child: Text(_controller.text, style: Theme.of(context).textTheme.bodyText2?.copyWith( color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    GestureDetector(
                      onTap: next,
                      child: Container(
                        margin: const EdgeInsets.only(right: 33, bottom: 80),
                        child: SvgPicture.asset(AssetPath.nextButtonLogo),
                      ),
                    )
                  ],
                ),
              ],
            )),
      );
    });
  }
}
