import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_or_portfolio_row_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class PortfolioDetails extends StatelessWidget {
  const PortfolioDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    showFundPortfolioDialog(){
      MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.9, MediaQuery.of(context).size.width /1.3, [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              Align(alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.clear, color: kOrange,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 27,),
              Text("You have ended this \nportfolio", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700,fontSize: 20),),
              const SizedBox(height: 20,),
              Text("Please note that this portfolio will \ncontinue to run until every loanee \non it are done repaying.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700,fontSize: 16),),
              const SizedBox(height: 37,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                  },
                  buttonText: "Continue",
                  height: 50, buttonColor: kGreen,
                  width: double.maxFinite,
                ),
              ),
              const Spacer(flex: 3,),
            ],
          ),
        )
      ]);
    }

    showEndPortfolioDialog(){
      MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.6, MediaQuery.of(context).size.width /1.3, [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 2,),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.warning_rounded, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 27,),
              Text("Are you sure you want to end this \nportfolio? There are still Loanees on \nthe portfolio.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
              const SizedBox(height: 40,),
              Text("Do you still want to end portfolio?", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700,fontSize: 16),),
              const SizedBox(height: 76,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                  },
                  buttonText: "No, Don’t",
                  height: 50, buttonColor: kGreen,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(height: 35,),
              TextButton(onPressed: (){
                Get.to(()=> BottomNavigationBarScreen());
              }, child: Text("Yes, End Portfolio",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kRedPink, decoration: TextDecoration.underline),)),
              const Spacer(flex: 2,),
            ],
          ),
        )
      ]);
    }
    return Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    SvgPicture.asset(AssetPath.edit),
                    Text("edit", style: TextStyle(color: kGreen, fontSize: 16, decoration: TextDecoration.underline),)
                  ],
                ),
              ),
            ),
          ],
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios, size: 20, color: kGreen,)),
          backgroundColor: kDarkBackGroundColor,
          title: Text("Loan Portfolio", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 23,),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 78, top: 10),
                  decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(8), border: Border.all(color: kBlue)),
                  child: Column(
                    children: [
                      LoanOrPortfolioRowTile(title: "Loan type", data: "Payday"),
                      LoanOrPortfolioRowTile(title: "Loan amount", data: "N50,000- N125,000"),
                      LoanOrPortfolioRowTile(title: "Interest rate", data: "3%"),
                      LoanOrPortfolioRowTile(title: "Interest type", data: "Monthly"),
                      LoanOrPortfolioRowTile(title: "Loan tenor", data: "180 days"),
                      LoanOrPortfolioRowTile(title: "Repayment amount", data: "N35,000 - N35,500"),
                      LoanOrPortfolioRowTile(title: "Total repayment amount", data: "N55,000 - N130,000"),
                      const SizedBox(height: 18,),
                      LoanOrPortfolioRowTile(title: "Repayment type", data: "Installments"),
                      LoanOrPortfolioRowTile(title: "Repayment occurrence", data: "Monthly"),
                      LoanOrPortfolioRowTile(title: "Repayment start date", data: "21 Mar 2021"),
                      LoanOrPortfolioRowTile(title: "Repayment start date", data: "21 Mar 2021"),
                      const SizedBox(height: 21,),
                      const Divider(color: kDarkPurple,),
                      LoanOrPortfolioRowTile(title: "Negotiation", data: "YES", dataTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: kGreen, fontWeight: FontWeight.bold, fontSize: 16),),
                      LoanOrPortfolioRowTile(title: "Loan extension ", data: "YES", dataTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: kGreen, fontWeight: FontWeight.bold, fontSize: 16),),
                      LoanOrPortfolioRowTile(
                        title: "Loan extension time",
                        data: "30 days",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 51,),
                ButtonWidget(
                    onPressed: () {
                      showFundPortfolioDialog();
                    },
                    buttonColor: kGreen,
                    buttonText: "Fund Portfolio",
                    borderRadius: 8,
                    height: 50,
                    width: 347),
                const SizedBox(height: 32,),
                TextButton(
                    onPressed: () {
                      showEndPortfolioDialog();
                    },
                    child: Text("End Portfolio", style: TextStyle(color: kDarkRed, fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                const SizedBox(height: 44,)
              ],
            ),
          ),
        ));
  }
}
