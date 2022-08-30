import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../../../../constants/asset_path.dart';
import '../../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../widgets/custom_loan_details_widget.dart';





class LoanRequestDetails extends StatefulWidget {
  const LoanRequestDetails({Key? key}) : super(key: key);

  @override
  State<LoanRequestDetails> createState() => _LoanRequestDetailsState();
}

class _LoanRequestDetailsState extends State<LoanRequestDetails> {
  bool? inSufficientFund = true;
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
