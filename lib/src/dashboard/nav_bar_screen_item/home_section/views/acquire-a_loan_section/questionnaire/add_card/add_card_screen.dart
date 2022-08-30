import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../constants/color_palette.dart';
import '../../../../../../../../shared_widgets/customButton.dart';
import '../../../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../../../shared_widgets/custom_form_field_widget.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {

  showAddCardSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 70, width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.credit_card_rounded, color: kWhite, size: 40,)),
              ),
            ),
            Container(height: 40, width:2, color: kGreen,),
            const SizedBox(height: 28,),
            Text("New card added", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 18,),
            Text("You have added a new card", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            const SizedBox(height: 71,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24.0),
              child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                    Get.to(()=> BottomNavigationBarScreen());
                  },
                  buttonText: "Continue",
                  height: 55, buttonColor: kGreen,
                  width: double.maxFinite
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  void showAddCardBottomSheet(){
    Get.bottomSheet(FractionallySizedBox(heightFactor: 0.65,
      child: Container(decoration: BoxDecoration(color: kLightBackGroundColor,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.8,), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(height: 5, width: 50, decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
            const SizedBox(height: 30,),
            Expanded(
              child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Link Card", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700 ),),

                              IconButton(onPressed: (){
                                Get.back();
                              }, icon: Icon(Icons.clear, color: kOrange,))
                            ],
                          ),
                          const SizedBox(height: 35,),
                          Text("Enter Card Number", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                          const SizedBox(height: 10,),
                          FormFieldWidget(
                            filledColor: kLightBackGroundColor,
                            hintText: "Card number",
                          ),
                          SizedBox(height: 30),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Expiry date", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 10,),
                                          FormFieldWidget(
                                            filledColor: kLightBackGroundColor,
                                            width: MediaQuery.of(context).size.width / 2.5,
                                            hintText: "MM/YY",
                                          ),
                                        ],
                                      ),
                                      Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("CVV", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 10,),
                                          FormFieldWidget(
                                            filledColor: kLightBackGroundColor,
                                            width: MediaQuery.of(context).size.width / 2.5,
                                            hintText: "123",
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("You will be charged a sum of N100 to add your card.",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                          const SizedBox(height: 35,),
                          ButtonWidget(
                              onPressed: (){
                                Get.back();
                                showAddCardSuccessDialog();
                              },
                              buttonText: "Link this  Card",
                              height: 55, buttonColor: kGreen,
                              width: double.maxFinite
                          ),
                        ],
                      )
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
      ),
      isScrollControlled: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
            appBar: AppBar(backgroundColor: kDarkBackGroundColor, elevation: 0.0, centerTitle: true,
              title: Text("Cards", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
              leading: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
            ),
            backgroundColor: kDarkBackGroundColor,
            body: Align(alignment: Alignment.center,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 140,),
                  CircleAvatar(
                    backgroundColor: kBlue,
                    radius: 50, child: Icon(Icons.credit_card_rounded, color: kWhite,size: 50,),
                  ),
                  const SizedBox(height: 40,),
                  Text("No Cards added", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.w700, fontSize: 20),),
                  const SizedBox(height: 10,),
                  Text("You do not have any Bank \naccount added yet.", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 14),),
                  const SizedBox(height: 121,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ButtonWidget(onPressed: (){
                      showAddCardBottomSheet();
                    }, buttonText: "Link Card", buttonColor: kGreen,
                        height: 55, width: double.maxFinite),
                  ),
                   const SizedBox(height: 191,),
                ],
              ),
            )
        )
    );
  }
}
