import 'dart:async';

import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/personal%20_information/setting_personal_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color_palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.to(() =>
        // BottomNavigationBarScreen()
        // MainOnBoardingScreen()
        const SettingPersonalInformation()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          body: Column(children: [
            const Spacer(),
            Image.asset(AssetPath.logo),
            const Spacer(),
            Stack(children: [
              Image.asset(AssetPath.splashImage),
              Positioned(
                bottom: 20,
                left: 80,
                child: Text(
                  ' Made with love by people who care',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: kWhite, fontSize: 16),
                ),
              )
            ])
          ])),
    );
  }
}
