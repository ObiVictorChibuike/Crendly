import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';

class LoanOfferAndAgreement extends StatefulWidget {
  const LoanOfferAndAgreement({Key? key}) : super(key: key);

  @override
  State<LoanOfferAndAgreement> createState() => _LoanOfferAndAgreementState();
}

class _LoanOfferAndAgreementState extends State<LoanOfferAndAgreement> {
  bool? isLoanRequest = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(centerTitle: false,
            appBarLabel: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Loan Requests & Offers", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
                const SizedBox(height: 5,),
                Text("See  all Loan requests and offer applications.",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
              ],
            ),
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(8)),
                height: 45, width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(
                                onPressed: (){
                                  setState(() {
                                    isLoanRequest = true;
                                  });
                                },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: isLoanRequest == true ? Colors.black : kWhite
                            ),
                                buttonColor: isLoanRequest == true ? kOrange : Colors.transparent, buttonText: "Loan Request",
                                width: MediaQuery.of(context).size.width / 2.5, height: 35
                            ),
                            ButtonWidget(
                                onPressed: (){
                                  setState(() {
                                    isLoanRequest = false;
                                  });
                                },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: isLoanRequest == false ? Colors.black : kWhite),
                                buttonColor: isLoanRequest == false ? kOrange : Colors.transparent, buttonText: "Loan Offer",
                                width: MediaQuery.of(context).size.width / 2.5, height: 35
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              isLoanRequest == true ?
              Column(
                children: [

                ],
              ) :
              Column(
                children: [

                ],
              )
            ],
          ),
        )
    );
  }
}
