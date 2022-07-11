import 'dart:async';
import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/intro_screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.to(()=> const MainOnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          body: Column(children: [
            const Spacer(),
            Image.asset(AssetPath.logo),
            const Spacer(),
            Stack(children: [
              Image.asset(AssetPath.splashImage),
              Positioned(bottom: 20, left: 80,
                child: Text(' Made with love by people who care', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),),
              )
            ])
          ])),
    );
  }
}
