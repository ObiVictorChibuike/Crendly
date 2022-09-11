import 'dart:async';

import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/auth/auth_screens/sign_in/sign_in.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/privacy_policy/policy_policy.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/settings_transaction_pin/settings_transaction_pin.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/support/support.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/terms_and-conditions/terms_and_conditions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../constants/asset_path.dart';
import '../../../../constants/color_palette.dart';
import '../../../../shared_widgets/custom_appBar.dart';
import '../../../../shared_widgets/custom_dialog_widget.dart';
import '../widgets/settings_tile.dart';
import 'delete_account/delete_account.dart';
import 'my_account/my_account.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  Widget _commentForm(){
    var maxLine = 8;
    return Container(margin: const EdgeInsets.symmetric(horizontal: 25), height: maxLine * 15.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: TextField(
        textInputAction: TextInputAction.next, keyboardType: TextInputType.name,
        maxLines: maxLine,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          fillColor: Colors.transparent,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.all(15),
        ),
        cursorColor: kPaleBlue,
        onChanged: (value){

        },
      ),
    );
  }

  showFeedBackDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.9, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
            ),
            const SizedBox(height: 31,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80, margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 41, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Text("Your feedback and review has \nbeen submitted", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  showRatingDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.55, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              const SizedBox(height: 21,),
              Text("Rate your experience \nwith the crendly app.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700,),),
              const SizedBox(height: 33,),
              RatingBar.builder(
                initialRating: 4, minRating: 1, direction: Axis.horizontal,
                allowHalfRating: true, unratedColor: Color(0xffC4C4C4),
                itemCount: 5, itemSize: 20, itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(Icons.star, color: Color(0xff2E4DBD),),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(height: 20,),
              Text("Write a comment", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
              const SizedBox(height: 8,),
              _commentForm(),
              const SizedBox(height: 19,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                    showFeedBackDialog();
                    Timer(Duration(seconds: 3), () {Get.back();});
                  },
                  buttonText: "Continue",
                  height: 50, buttonColor: kGreen,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(height: 36,),
              TextButton(onPressed: (){},
                child: Text("Not Now", style:
                Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700,fontSize: 16, decoration: TextDecoration.underline),),
              )
            ],
          ),
        ),
      )
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: false,
        appBarLabel: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                width: 348,
                height: 182,
                decoration: BoxDecoration(
                    color: kBlue, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: SvgPicture.asset(
                              AssetPath.orangeHead,
                              theme: const SvgTheme(fontSize: 25),
                              width: 41,
                              height: 48,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Danny Rand",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: kWhite),
                            ),
                            Row(
                              children: [
                                Text(
                                  "FCMB - 2199987626",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: kWhiteWithOpacity),
                                ),
                                SvgPicture.asset(AssetPath.copy)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: 323,
                        child: const Divider(
                          color: kLighterGreen,
                        )),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Loan Requested",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kWhiteWithOpacity, fontSize: 12),
                        ),
                        Text(
                          "7 (N3,100,000",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Loan Granted",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kWhiteWithOpacity, fontSize: 12),
                        ),
                        Text(
                          "8 (N3,100,000",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: double.maxFinite,
                height: 150,
                child: DottedBorder(
                    dashPattern: [4, 6],
                    color: kBrighterBackGroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Your Credit Score", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16 ,fontWeight: FontWeight.w400),),
                              Text("82", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16 ,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          StepProgressIndicator(
                            totalSteps: 100, currentStep: 32,
                            size: 8, padding: 0, selectedColor: Colors.yellow, unselectedColor: Colors.cyan,
                            roundedEdges: Radius.circular(10),
                            selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.deepOrange, Colors.orange],
                            ),
                            unselectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.yellow, kGreen],
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Your Reputation Score", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16 ,fontWeight: FontWeight.w400),),
                              Text("72", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16 ,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          StepProgressIndicator(
                            totalSteps: 100, currentStep: 32, size: 8, padding: 0,
                            selectedColor: Colors.yellow, unselectedColor: Colors.cyan,
                            roundedEdges: Radius.circular(10),
                            selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.deepOrange, Colors.orange],
                            ),
                            unselectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.yellow, kGreen],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              DottedBorder(child: Column()),
              SettingTile(
                iconData: Icons.person,
                title: "My Account",
                subtitle: "In integer ac faucibus ante in euismod enim.",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => MyAccount()));
                },
              ),
              SettingTile(
                iconData: Icons.privacy_tip_rounded,
                title: "Transaction Pin",
                subtitle: "In integer ac faucibus ante in euismod enim.",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => SettingsTransactionPin()));
                },
              ),
              SettingTile(
                  iconData: Icons.lock_open_sharp,
                  title: "Biometric Login",
                  toRotate: true,
                  turns: 0,
                  subtitle: "In integer ac faucibus ante in.",
                  onTap: () {},
                  trailing: toggleSwitch()),
              SettingTile(
                  iconData: Icons.lock_open_sharp,
                  title: "Biometric Transaction",
                  subtitle: "In integer ac faucibus ante in.",
                  toRotate: true,
                  turns: 0,
                  onTap: () {},
                  trailing: toggleSwitch()),
              SettingTile(
                  iconData: Icons.remove_red_eye,
                  title: "Hide my visibility",
                  subtitle: "In integer ac faucibus ante in.",
                  onTap: () {},
                  trailing: toggleSwitch()),
              SettingTile(
                iconData: Icons.headset_mic,
                title: "Support",
                subtitle: "In integer ac faucibus ante in euismod enim.",
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (builder) => Support()));
                },
              ),
              SettingTile(
                iconData: Icons.star,
                title: "Rate our App",
                subtitle: "In integer ac faucibus ante in euismod enim.",
                onTap: () {
                  showRatingDialog();
                },
              ),
              SettingTile(
                  iconData: Icons.sunny,
                  title: "Light mode",
                  subtitle: "In integer ac faucibus ante in euismod enim.",
                  onTap: () {},
                  trailing: toggleSwitch(isSwitch: true)),
              SettingTile(
                iconData: Icons.privacy_tip_rounded,
                title: "Privacy Policy",
                subtitle: "In integer ac faucibus ante in euismod enim.",
                onTap: () {
                  Get.to(()=> const PrivacyPolicy());
                },
              ),
              SettingTile(
                iconData: Icons.insert_drive_file,
                title: "Terms & Conditions",
                subtitle: "In integer ac faucibus ante in euismod enim.",
                onTap: () {
                  Get.to(()=> const TermsAndConditions());
                },
              ),
              const SizedBox(
                height: 41,
              ),
              ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => SignIn()));
                  },
                  buttonColor: kDarkBackGroundColor,
                  borderColor: kRed,
                  buttonText: "Logout",
                  buttonTextStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kRed),
                  height: 50,
                  width: 348),
              const SizedBox(
                height: 21,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => DeleteAccount()));
                  },
                  child: Text(
                    "Delete My Account",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold, color: kRed),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleSwitch({bool? isSwitch}) {
    bool isSwitched = isSwitch ?? false;
    return CupertinoSwitch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      thumbColor: isSwitched ? kGreen : kDarkBlue,
      trackColor: kLightBackGroundColor,
      activeColor: kWhite,
    );
  }
}
