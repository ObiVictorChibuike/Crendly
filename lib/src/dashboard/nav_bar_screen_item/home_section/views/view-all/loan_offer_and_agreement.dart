import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/view-all/view_all_loan_request_details.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/view-all/loan_offer_and_agreement_details.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/view-all/widget/loan_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanOfferAndAgreement extends StatefulWidget {
  const LoanOfferAndAgreement({Key? key}) : super(key: key);

  @override
  State<LoanOfferAndAgreement> createState() => _LoanOfferAndAgreementState();
}

class _LoanOfferAndAgreementState extends State<LoanOfferAndAgreement> {
  bool? isLoanRequest = true;
  final List requestReceived= DummyData.requestReceived;
  final List offerRequests= DummyData.offerRequests;
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(21.0, 30.0,21.0,0.0),
            child: Column(
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
                                  buttonColor: isLoanRequest == false ? kOrange : Colors.transparent, buttonText: "Offer Request",
                                  width: MediaQuery.of(context).size.width / 2.5, height: 35
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                isLoanRequest == true ?
                Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ...List.generate(requestReceived.length, (index){
                            return LoanOfferWidget(
                              date: requestReceived[index]["date"],
                              time: requestReceived[index]["time"],
                              body: requestReceived[index]["body"],
                              timeOut: requestReceived[index]["timeout"],
                              titleName: requestReceived[index]["titleName"],
                              buttonText: "View Offer",onTap: (){
                                Get.to(()=> const AllLoanRequestDetails());
                            },
                            );
                          })
                        ],
                      ),
                    )
                ) :
                Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ...List.generate(offerRequests.length, (index){
                            return LoanOfferWidget(
                              date: offerRequests[index]["date"],
                              action: offerRequests[index]["action"],
                              body: offerRequests[index]["body"],
                              timeOut: offerRequests[index]["timeout"],
                              title: offerRequests[index]["title"],
                              buttonText: "View Loan", onTap: (){
                                Get.to(()=> const LoanOfferAndAgreementDetails());
                            },
                            );
                          })
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
