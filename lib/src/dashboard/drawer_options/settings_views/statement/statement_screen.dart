import 'dart:async';

import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../../bottom_nav_bar/bottom_nav_bar_screen.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  showStatementGeneratedDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: Center(child: SvgPicture.asset(AssetPath.generatedFile)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 20,),
              Align( alignment: Alignment.center,
                  child: Text("Statement Generated", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("Your statement has been generated \nand sent to your email address.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
              ),
              const Spacer(flex: 5,),
            ],
          ),
        ),
      )
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0, backgroundColor: kDarkBackGroundColor,  centerTitle: true,
            title: Text("Generate Statement", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700),),
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          ),
          backgroundColor: kDarkBackGroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Column(
                children: [
                  const SizedBox(height: 31,),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20), decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(8)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Account balance", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                        const SizedBox(height: 18,),
                        Text("₦350,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 32, fontWeight: FontWeight.w700, color: kWhite),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 27,),
                  FormFieldWidget(
                    readOnly: true,
                    initialValue: "damilarebenson@gmail.com",
                    filledColor: kDarkBackGroundColor,
                    labelTitle: "Email Address",
                    hintText: "Enter email",
                  ),
                  const SizedBox(height: 13,),
                  FormFieldWidget(
                    filledColor: kDarkBackGroundColor,
                    suffixIcon: Icon(Icons.calendar_today, color: kWhite,),
                    labelTitle: "Start date",
                    hintText: "23/4/2022",
                  ),
                  const SizedBox(height: 13,),
                  FormFieldWidget(
                    suffixIcon: Icon(Icons.calendar_today, color: kWhite,),
                    filledColor: kDarkBackGroundColor,
                    labelTitle: "End date",
                    hintText: "23/4/2022",
                  ),
                  const SizedBox(height: 35,),
                  ButtonWidget(
                      onPressed: (){
                        showStatementGeneratedDialog();
                        Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
                      }, buttonColor: kGreen,
                      buttonText: "Generate Statement",
                      height: 50, width: double.maxFinite)
                ],
              ),
            ),
          ),
        )
    );
  }
}
