import 'dart:async';

import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../widget/transaction_pin_bottomsheet.dart';

class IssueLoanOfferToBorrower extends StatefulWidget {
  const IssueLoanOfferToBorrower({Key? key}) : super(key: key);

  @override
  State<IssueLoanOfferToBorrower> createState() => _IssueLoanOfferToBorrowerState();
}

class _IssueLoanOfferToBorrowerState extends State<IssueLoanOfferToBorrower> {

  bool? isCardSelected = true;

  showTopUpSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.add, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 40,),
            Text("TopUp successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Your wallet topup was successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
            const SizedBox(height: 40,),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.back();
                },
                buttonText: "Go to Home",
                height: 55, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  void showTopUPWalletBottomSheet(){
    Get.bottomSheet(FractionallySizedBox(heightFactor: 0.75,
      child: Container(decoration: BoxDecoration(color: kLightBackGroundColor,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.8,), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: StatefulBuilder(builder: (context, mySetState){
            return Column(
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
                                  Expanded(
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("TopUp Wallet", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
                                        IconButton(
                                            onPressed: (){
                                              Get.back();
                                            },
                                            icon: Icon(Icons.clear, color: kOrange, size: 25,)
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Text("How much do you want to fund?",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                              const SizedBox(height: 13,),
                              FormFieldWidget(
                                filledColor: kLightBackGroundColor,
                                hintText: "Enter amount",
                              ),
                              const SizedBox(height: 24,),
                              DottedLine(
                                dashColor: Color(0xff163393),
                              ),
                              const SizedBox(height: 24,),
                              Text("Fund your wallet using",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                              const SizedBox(height: 13,),
                              Container(
                                decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(8)),
                                height: 55, width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ButtonWidget(
                                                onPressed: (){
                                                  mySetState(() {
                                                    isCardSelected = true;
                                                  });
                                                },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                                color: isCardSelected == true ? Colors.black : kWhite
                                            ),
                                                buttonColor: isCardSelected == true ? kOrange : Colors.transparent, buttonText: "Card",
                                                width: MediaQuery.of(context).size.width / 2.5, height: 45
                                            ),
                                            ButtonWidget(
                                                onPressed: (){
                                                  mySetState(() {
                                                    isCardSelected = false;
                                                  });
                                                },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: isCardSelected == false ? Colors.black : kWhite),
                                                buttonColor: isCardSelected == false ? kOrange : Colors.transparent, buttonText: "Bank Transfer",
                                                width: MediaQuery.of(context).size.width / 2.5, height: 45
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,),
                              isCardSelected == true ? Column(
                                children: [
                                  Text("Enter Card Number",
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                                  const SizedBox(height: 13,),
                                  FormFieldWidget(
                                    filledColor: kLightBackGroundColor,
                                    hintText: "Card number",
                                  ),
                                  const SizedBox(height: 24,),
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
                                  const SizedBox(height: 30,),
                                  Text("You will be charged a sum of N200,000.",
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: kWhite),),
                                  const SizedBox(height: 50,),
                                  ButtonWidget(
                                      onPressed: (){
                                        Get.back();
                                        showPinBottomBottomSheet(context: context,
                                            onPressed: () {
                                              Get.back();
                                              showTopUpSuccessDialog();
                                              Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
                                            });
                                      }, buttonText: "Pay N200,000",buttonColor: kGreen,
                                      height: 55, width: double.maxFinite
                                  ),
                                  const SizedBox(height: 50,),
                                ],
                              ) :
                              Column(
                                children: [
                                  DottedBorder(color: Color(0xffC1CDF6), dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(alignment: Alignment.center,
                                              child: Text("Make payment using this bank details.",
                                                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                                            ),
                                            const SizedBox(height: 20,),
                                            const Divider(
                                              color: Color(0xffC1CDF6),
                                            ),
                                            const SizedBox(height: 20,),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Account Name: ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                        Text("WEMA", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                      ],
                                                    )
                                                )
                                              ],
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Account Number: ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                        Text("588291782882", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                        IconButton(onPressed: (){

                                                        }, icon: Icon(Icons.file_copy_outlined, color: kOrange,))
                                                      ],
                                                    )
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              )
                            ],
                          )
                        ]
                    ),
                  ),
                ),
              ],
            );
          })
      ),
    ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),),
        isScrollControlled: true, isDismissible: false
    );
  }

  showTopUpDialog(){
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
                  child: const Center(child: Icon(Icons.local_print_shop_outlined, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 13,),
              Align( alignment: Alignment.center,
                  child: Text("Insufficient wallet balance", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("Please topup your wallet with the specified loan amount before issuing the offer.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              const SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 49.0),
                child: ButtonWidget(onPressed: (){
                  showTopUPWalletBottomSheet();
                }, buttonText: "Top up Wallet",
                    height: 50, width: double.maxFinite, buttonColor: kGreen,
                ),
              ),
              const Spacer(flex: 4,),

            ],
          ),
        ),
      )
    ]);
  }

  showSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 40,),
              Align( alignment: Alignment.center,
                  child: Text("Offer Has Been Issued to Borrower", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("You have accepted this Loan request. A notification of your acceptance will be sent to the Borrower. ", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      )
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            centerTitle: false,
            onBackPressed: (){
              Get.back();
            },
            appBarLabel: Text("Issue Loan Offer to Borrower", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 21,),
                  RichText(
                    text: TextSpan(text: 'Loan Offer Issued to: ', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOffWhite, fontSize: 14, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: 'Danny Rand', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700,))
                        ]),
                  ),
                  const SizedBox(height: 35,),
                  RichText(
                    text: TextSpan(text: 'Borrower’s name: ', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOffWhite, fontSize: 14, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: 'Danny Rand', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700,))
                        ]),
                  ),
                  const SizedBox(height: 16,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Borrower's \naddress", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontWeight: FontWeight.w400, fontSize: 16)),
                      Text("3891 Ranchview Dr. \nRichardson, California 62639", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Text("Hi Danny,", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 12,),
                  Container(
                    width: double.maxFinite,
                    child: Text("I refer to our prior correspondence "
                        "on the subject and I am pleased to offer the "
                        "below-mentioned loan offer to you, under the "
                        "terms and conditions stated below:",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                  const SizedBox(height: 16,),
                  Container(width: double.maxFinite, padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.circular(8),),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            Text("Tenor", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₦ 65,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("6 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        const SizedBox(height: 19,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Monthly repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₦ 15,500", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("2% Monthly", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        const SizedBox(height: 25,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Disbursment account", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            Text("Account number", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Access Bank", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("0137648847", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        const SizedBox(height: 13,),
                        const Divider(color: Color(0xff2E4DBD),),
                        const SizedBox(height: 11,),
                        Align(alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(text: 'Crendly Charges ',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 12, fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(text: '₦500', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 12, fontWeight: FontWeight.w700,))
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 11,),
                  Text("Conditions Precedent to Drawdown", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                  const SizedBox(height: 6,),
                  ...List.generate(DummyData.conditions.length, (index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Text(DummyData.conditions[index]["nos"]!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 14),),
                          const SizedBox(width: 10,),
                          Expanded(child:Text(DummyData.conditions[index]["conditions"]!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 14),))
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 24,),
                  Text("The above summary terms and conditions are preliminary and are subject to change "
                      "and do not purport to summarize all of the terms and conditions contained in "
                      "definitive legal documentation for this loan facility contemplated hereby."
                      "Please indicate your acceptance of the above facility and the terms and conditons "
                      "by signing this letter, within 3 (three) days from the date of this letter, failing "
                      "which the offer shall lapse without any liability or commitment on the part of "
                      "the Lender.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 34,),
                  Align(alignment: Alignment.center,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_copy_outlined, color: kGreen,),
                        const SizedBox(width: 10,),
                        Text("View Full Contract", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, color: kGreen),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 48,),
                  ButtonWidget(
                      onPressed: (){
                        //showTopUpDialog();
                        showSuccessDialog();
                        Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
                      },
                      buttonText: "Issue Loan offer", buttonColor: kGreen,
                      height: 50, width: double.maxFinite
                  ), const SizedBox(height: 96,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
