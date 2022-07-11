import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:crendly/src/intro_screens/onboarding/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({Key? key}) : super(key: key);

  @override
  _MainOnBoardingScreenState createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  final _controller = PageController();
  String text = 'Later';
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 0) {
        setState(() {
          text = 'Later';
        });
      }else if(_controller.page == 1){
        setState(() {
          text = 'Back';
        });
      }
    });
  }


  void next() {
    if (_controller.page == 2) {
      Get.to(()=> const LandingPage());
    } else {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.page == 0) {
      Get.to(()=> const LandingPage());
    }
    _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn,);
  }
  List<Widget> onBoardingScreens = DummyData.onBoardingViews;

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  children:  onBoardingScreens,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: previous,
                    child: Container(
                      margin: const EdgeInsets.only(left: 33, bottom: 40),
                      child: Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith( color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  GestureDetector(
                    onTap: next,
                    child: Container(
                      margin: const EdgeInsets.only(right: 33, bottom: 40),
                      child: SvgPicture.asset(AssetPath.nextButtonLogo),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
