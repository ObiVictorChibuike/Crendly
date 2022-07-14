import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import '../../../playground/views/playground_main_screen.dart';

class PermissionAccess extends StatelessWidget {
  const PermissionAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios, color: kWhite,),
            ),
            centerTitle: true, backgroundColor: kDarkBackGroundColor, elevation: 0.0,
            title: Text("Permission Access", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Text("We need some access. Please enable the following permission to continue.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
              ),
              const Spacer(),
              Align(alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(child: SvgPicture.asset(AssetPath.world)),
                    Positioned(right: 0.0,
                        child: SvgPicture.asset(AssetPath.darkBgCircle)),
                    Positioned(right: 0,top: 10,left: 50,
                        child: Icon(Icons.location_on, color: kGreen,size: 40,)
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(AssetPath.ellipse),
              const SizedBox(height: 30,),
              Text("Your Location", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, color: kWhite),),
              const Spacer(flex: 3,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonWidget(onPressed: (){
                  Get.to(()=> const BottomNavigationBarScreen());},
                    buttonText: "Allow Location Access",
                    height: 55, buttonColor: kGreen,
                    width: double.maxFinite
                ),
              ),
              const SizedBox(height: 40,),
              TextButton(
                  onPressed: (){
                    Get.to(()=> const PlayGroundHomeScreen());
                  },
                  child: Text("Do this Later",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)),
              const Spacer()
            ],
          ),
        )
    );
  }
}
