import 'dart:async';

import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/view-all/issue_loan_offer_to_borrower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';

import '../../../../../../constants/asset_path.dart';
import '../../../../../../constants/color_palette.dart';
import '../../../../../../constants/dummy_data.dart';
import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../shared_widgets/custom_outlined_button.dart';
import '../../../../bottom_nav_bar/bottom_nav_bar_screen.dart';
import '../lender/widgets/custom_loan_details_widget.dart';

class AllLoanRequestDetails extends StatefulWidget {
  const AllLoanRequestDetails({Key? key}) : super(key: key);

  @override
  State<AllLoanRequestDetails> createState() => _AllLoanRequestDetailsState();
}

class _AllLoanRequestDetailsState extends State<AllLoanRequestDetails> {

  showRejectedNegotiationDialog(){
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
                  child: Text("Negotiation request \nrejected", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("You have rejected this negotiation request. A notification of your rejection will be sent to the Borrower. ", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(text: 'Portfolio: ',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(text: 'Payday Loan', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700,))
                            ]),
                      ),
                      Text("View all",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      ImageStack(
                        imageSource: ImageSource.Asset, imageRadius: 20,
                        showTotalCount: false, backgroundColor: kWhite,
                        imageList: DummyData.stackImages, imageBorderColor: kWhite,
                        totalCount:DummyData.stackImages.length,
                        imageCount: 3, imageBorderWidth: 2,
                      ),
                      const SizedBox(width: 10,),
                      Text("12 other people are interested \nin this Offer.",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: kWhite),),
                    ],
                  ),
                  const SizedBox(height: 140,),
                  ButtonWidget(
                      onPressed: (){
                        Get.to(()=> const IssueLoanOfferToBorrower());
                      },
                      buttonColor: kGreen, buttonText: "Accept Request", borderRadius: 8,
                      height: 50, width: double.maxFinite
                  ),
                  const SizedBox(height: 8,),
                  CustomOutlineButton(text: 'Reject Request',
                      onPressed: () {
                        showRejectedNegotiationDialog();
                        Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
                      }),
                  const SizedBox(height: 116,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
