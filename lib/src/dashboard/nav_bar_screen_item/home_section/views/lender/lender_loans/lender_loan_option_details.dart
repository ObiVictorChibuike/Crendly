import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../../../../constants/asset_path.dart';
import '../../../../../../../shared_widgets/custom_buttom_sheet.dart';
import '../../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../../widget/transaction_pin_bottomsheet.dart';
import '../widgets/custom_loan_details_widget.dart';





class LoanRequestDetails extends StatefulWidget {
  const LoanRequestDetails({Key? key}) : super(key: key);

  @override
  State<LoanRequestDetails> createState() => _LoanRequestDetailsState();
}

class _LoanRequestDetailsState extends State<LoanRequestDetails> {
  bool? inSufficientFund = true;
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
  void showMyDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(alignment: Alignment.centerRight,
                      child: IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(height: 73, width: 73,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 3), color: const Color(0xff081952)),
                        child: Center(child:  inSufficientFund == true ? Icon(Icons.warning_rounded, color: kOrange, size: 40,) :
                        Icon(Icons.check_circle, color: kOrange, size: 40,)),
                      ),
                    ),
                    Container(height: 40, width: 3, color: kGreen,),
                    const SizedBox(height: 20,),
                    inSufficientFund == true ? Text("Low on Funds", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)
                    : Text("You have accepted this loan request. ", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
                    const SizedBox(height: 20,),
                    inSufficientFund == true ? Text("Sorry, you don't have enough funds in your Crendly wallet to grand a loan at the moment. Kindly top up your wallet and try again.", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),)
                    :Text("Nice. You accepted this loan request. A notification will be sent to the borrower immediately.", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                    const Spacer(flex: 2,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){
                            Get.back();
                            Get.to(()=> const BottomNavigationBarScreen());
                          }, child: Text("Not Now", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)),
                          ButtonWidget(onPressed: (){
                            Get.back();
                            showTopUPWalletBottomSheet();
                          }, buttonText: "Topup", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            height: 50, width: MediaQuery.of(context).size.width / 3.2, buttonColor: kGreen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ]);
  }


  void showActionBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/3,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Take an action", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, color: kOrange,),),
            ],
          ),
          const SizedBox(height: 50,),
          InkWell(onTap: (){
            Get.back();
            showMyDialog();
          },
              child: Container(
                height: 30, width: double.maxFinite,
                  child: Text("Grant Loan Request", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),))),
          const Divider(color: almostGrey,),
          const SizedBox(height: 20,),
          InkWell(onTap: (){

          },
            child: Container(height: 30, width: double.maxFinite,
                child: Text("Negotiate interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),)),
          )
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            backgroundColor: kDarkBackGroundColor, centerTitle: true, elevation: 0.0,
            leading:  IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
            title: Text("Loan Request Details", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Container(height: MediaQuery.of(context).size.height / 1.7, width: double.maxFinite, padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Color(0xff4700E0), borderRadius: BorderRadius.circular(8)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 64, width: 64,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: kWhite),
                                child: Center(
                                  child: Image.asset(AssetPath.profilePic,),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5.0, right: 10.0,
                              child: Container(
                                height: 15, width: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue, border: Border.all(color: kWhite)),
                                child: Icon(Icons.check, color: kWhite, size: 10,),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text("David Emmanuel", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                        Text("Loan requested on 12th Feb 2022", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                        const SizedBox(height: 10,),
                        RatingBar.builder(
                          initialRating: 4, minRating: 1, direction: Axis.horizontal,
                          allowHalfRating: true, unratedColor: Color(0xffC4C4C4),
                          itemCount: 5, itemSize: 20, itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(height: 40,),
                        CustomLoanRequestWidget(
                          creditScore: "75%",
                          loanAmount: "N20,000",
                          interestRate: "5%",
                          interestType: "Monthly",
                          repaymentAmount: "N25,500",
                          requestDate: "21-Jan-2021",
                          repaymentType: "Installments",
                          duration: "7 Days",
                          repaymentStartDate: "21 Mar 2021",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28,),
                  Text("Loan Action", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffFF3A5A).withOpacity(0.5), radius: 8,
                        child: const CircleAvatar(radius: 5,
                          backgroundColor: const Color(0xffFF3A5A),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      RichText(textAlign: TextAlign.center, text: TextSpan(text: "Request submitted by ", style: TextStyle(color: kWhite, fontSize: 12,fontFamily: "KumbhSans"), children: [
                        TextSpan(text: "David Emmanuel", style: TextStyle(color: kOrange,fontWeight: FontWeight.w400, fontFamily: "KumbhSans")),
                      ]
                      )),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text("21/02/2021 3:45pm", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: almostGrey, fontSize: 16),),
                  const SizedBox(height: 50,),
                  ButtonWidget(onPressed: (){
                    inSufficientFund = !inSufficientFund!;
                    Get.to(()=> BottomNavigationBarScreen());
                    showMyDialog();
                  }, buttonText: "Accept Request", height: 50, width: double.maxFinite, buttonColor: kGreen,)
                ],
              ),
            ),
          ),
        )
    );
  }
}
