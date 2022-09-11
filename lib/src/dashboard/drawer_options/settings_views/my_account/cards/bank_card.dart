import 'dart:async';
import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_buttom_sheet.dart';
import '../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../../../bottom_nav_bar/bottom_nav_bar_screen.dart';

class BankCard extends StatefulWidget {
  const BankCard({Key? key}) : super(key: key);

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  List bankCards = [];

  void addCard(String cardNumber, String expiryDate, String cvv) {
    setState(() {
      bankCards.add(
          {"cardNumber": cardNumber, "expiryDate": expiryDate, "cvv": cvv});
      print("Bank Accounts: $bankCards");
    });
  }

  void removeCard(int index) {
    setState(() {
      bankCards.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    void LinkCardBottomSheet(context) {
      Get.bottomSheet(
          FractionallySizedBox(
            heightFactor: 0.65,
            child: Container(
                decoration: BoxDecoration(
                    color: kLightBackGroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.8,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: StatefulBuilder(builder: (context, mySetState) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Link Card",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        color: kWhite,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(
                                                    Icons.clear,
                                                    color: kOrange,
                                                    size: 25,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FormFieldWidget(
                                      filledColor: kLightBackGroundColor,
                                      controller: cardNumberController,
                                      labelTitle: "Enter Card Number",
                                      hintText: "Card number",
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FormFieldWidget(
                                              filledColor: kLightBackGroundColor,
                                              controller: expiryDateController,
                                              labelTitle: "Expiry date",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              hintText: "MM/YY",
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FormFieldWidget(
                                                  filledColor: kLightBackGroundColor,
                                                  controller: cvvController,
                                                  labelTitle: "CVV",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.3,
                                                  hintText: "123",
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "You will be charged a sum of N100 to "
                                      "add to your card.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: kWhite,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    ButtonWidget(
                                      onPressed: () {
                                        addCard(
                                            cardNumberController.text,
                                            expiryDateController.text,
                                            cvvController.text);
                                        Get.back();
                                      },
                                      buttonText: "Link Bank Account",
                                      height: 50,
                                      width: 347,
                                      buttonTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: kDarkBackGroundColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      buttonColor: kGreen,
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  );
                })),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          isScrollControlled: true,
          isDismissible: false);
    }

    return Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(
          backgroundColor: kDarkBackGroundColor, centerTitle: true, elevation: 0.0,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          title: Text("Cards", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
          actions: [
            bankCards.isEmpty ? const SizedBox() : IconButton(onPressed: (){
              LinkCardBottomSheet(context);
            }, icon: Icon(Icons.add, color: kOrange,))
          ],
        ),
        body: bankCards.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: kDarkPurple,
                      radius: 48,
                      child: Icon(
                        Icons.credit_card,
                        color: kWhite,
                        size: 45,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      "No Cards added",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56.0),
                      child: Text(
                        "You do not have any Bank Account account added yet",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: kWhiteWithOpacity,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 121,
                    ),
                    ButtonWidget(
                      onPressed: () {
                        LinkCardBottomSheet(context);
                      },
                      buttonText: "Link Bank Account",
                      height: 50,
                      width: 347,
                      buttonTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: kDarkBackGroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                      buttonColor: kGreen,
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  children: [
                    const SizedBox(height: 47,),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: bankCards.length,
                        itemBuilder: (context, index) {
                          String accountName = bankCards[index]["cardNumber"];
                          String bankName = bankCards[index]["expiryDate"];
                          String accountNumber = bankCards[index]["cvv"];
                          return bankCardTile(
                              accountName, bankName, accountNumber, index);
                        }),

                  ],
                ),
              ));
  }

  void showDeleteCardBottomSheet(BuildContext context, int index){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/2.5,
        children: [
          Align(alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.clear, color: kOrange,),),
          ),
          const SizedBox(height: 30,),
          Align(alignment: Alignment.center,
            child: Text("Delete Card", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          const SizedBox(height: 12,),
          Align(alignment: Alignment.center,
            child: Text("Are you sure you want to delete \nthis card?", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
          ),
          const SizedBox(height: 66,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                Get.back();
                removeCard(index);
                showCardDeletedSuccessDialog();
                Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
              }, child: Text("Yes, Delete Card",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kRedPink, decoration: TextDecoration.underline, fontSize: 16, fontWeight: FontWeight.w700),)),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(8)),
                  child: Text("No, Keep Card",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kDarkBackGroundColor, fontWeight: FontWeight.w700, fontSize: 16),),
                ),
              )
            ],
          )
        ]
    );
  }

  showCardDeletedSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Align(alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.delete, color: kOrange, size: 35,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 30,),
              Align( alignment: Alignment.center,
                  child: Text("Card deleted successfully", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("Your card was deleted succesfully.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
              ),
              const Spacer(flex: 4,),
            ],
          ),
        ),
      )
    ]);
  }

  Widget bankCardTile(String cardNumber, String expiryDate, String cvv, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 4, width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.65, padding: EdgeInsets.fromLTRB(20, 20,0.0, 20),
            decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage(AssetPath.cardWaterMask)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AssetPath.masterCard),
                const Spacer(),
                Text("XXXX XXXX XXXX 7645", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text("02/23",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),),
                    const SizedBox(width: 15,),
                    Text("112", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),)
                  ],
                )
              ],
            ),
          ),
         Expanded(
             child: Container(
               padding: EdgeInsets.fromLTRB(5.0, 10,20, 20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                 gradient: LinearGradient(
                     colors: orangeGradient),
               ),
               child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Align(alignment: Alignment.topRight,
                       child: IconButton(onPressed: (){
                         showDeleteCardBottomSheet(context, index);
                       }, icon: Icon(Icons.delete, color: Colors.black,))),
                   Text("Expires in 3 days",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w700),)
                 ],
               ),
             )
         )
        ],
      ),
    );
  }
}
