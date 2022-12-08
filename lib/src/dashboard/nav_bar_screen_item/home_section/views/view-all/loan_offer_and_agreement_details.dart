import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/view-all/widget/loan_offer_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanOfferAndAgreementDetails extends StatelessWidget {
  const LoanOfferAndAgreementDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List loanOfferDetails = DummyData.loanOfferDetails;
    return SafeArea(top: false, bottom: false,
        child: Scaffold(backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(backgroundColor: kDarkBackGroundColor, elevation: 0.0, title: Text("Loan Details",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ...List.generate(loanOfferDetails.length, (index){
                  return LoanOfferDetailsWidget(
                    loanType:  loanOfferDetails[index]["loan_type"],
                    loanAmount: loanOfferDetails[index]["loan_amount"],
                    interestRate: loanOfferDetails[index]["interest_rate"],
                    interestType: loanOfferDetails[index]["interest_type"],
                    loanTenor: loanOfferDetails[index]["loan_tenor"],
                    repaymentAmount: loanOfferDetails[index]["repayment_amount"],
                    totalRepaymentAmount: loanOfferDetails[index]["total_repayment_amount"],
                    repaymentType: loanOfferDetails[index]["repayment_type"],
                    repaymentOccurance: loanOfferDetails[index]["repayment_occurance"],
                    repaymentStartDate: loanOfferDetails[index]["repayment_start_date"],
                    repaymentEndDate: loanOfferDetails[index]["repayment_end_date"],
                    negotiation: loanOfferDetails[index]["negotiation"],
                    loanExtension: loanOfferDetails[index]["loan_extension"],
                    loanExtensionTime: loanOfferDetails[index]["loan_extension_time"],
                    status: loanOfferDetails[index]["status"],
                  );
                })
              ],
            ),
          ),
        )
    );
  }
}
