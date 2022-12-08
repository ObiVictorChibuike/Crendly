import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/create_portfolio_process/widget/loan_portfolio_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanPortfolio extends StatelessWidget {
  const LoanPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showPortfolioSuccessDialog(){
      MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 1,),
              Align(alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 70, width: 70, margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 20,),
              Text("You've placed  out a \nloan offer", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
              const SizedBox(height: 5,),
              Text("Nice. You have publish a loan offer. \nBorrowers will be able to see your offer.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
              const Spacer(flex: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonWidget(
                  onPressed: (){

                  },
                  buttonText: "Track Portfolio",
                  height: 50, buttonColor: kGreen,
                  width: double.maxFinite,
                ),
              ),
              const Spacer(flex: 4,),
            ],
          ),
        )
      ]);
    }
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(centerTitle: true, actions: [
          TextButton(onPressed: (){}, 
              child: Row(
                children: [
                  Icon(Icons.edit, color: kGreen,),
                  Text("edit", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 16, decoration: TextDecoration.underline),)
                ],
              )
          )
        ], title: Text("Loan Portfolio", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
          elevation: 0.0, backgroundColor: kDarkBackGroundColor,
          leading: IconButton(onPressed: (){Get.back();},
              icon: Icon(Icons.arrow_back_ios, size: 20, color: kGreen,)),),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                LoanPortfolioDetailsWidget(
                  loanType: "Payday",
                  portfolioAmount: " ₦700,000",
                  loanAvailableTo: "8 People",
                  loanAmount: " ₦125,000/Person",
                  interestRate: "3%",
                  interestType: "Monthly",
                  loanTenor: "180 days",
                  repaymentAmount: "₦35,500",
                  totalRepaymentAmount: "₦130,000",
                  repaymentType: "Installments",
                  repaymentOccurance: "Monthly",
                  repaymentStartDate: "21 Mar 2021",
                  repaymentEndDate: "21 Jun 2021",
                  negotiation: "YES",
                  loanExtension: "YES",
                  loanExtensionTime: "30 days",
                ),
                const SizedBox(height: 26,),
                ButtonWidget(
                    onPressed: (){
                      showPortfolioSuccessDialog();
                    }, buttonColor: kGreen,
                    buttonText: "Publish Loan offer", height: 50, width: double.maxFinite),
                const SizedBox(height: 45,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
