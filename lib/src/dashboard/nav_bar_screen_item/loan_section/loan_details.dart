import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_or_portfolio_row_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/color_palette.dart';
import '../../../../shared_widgets/customButton.dart';

class LoanDetails extends StatelessWidget {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          title: Text("Payday Loan", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 23,
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 78, top: 10),
                  decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kBlue)),
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
                      LoanOrPortfolioRowTile(
                          title: "Repayment type", data: "Installments"),
                      LoanOrPortfolioRowTile(
                          title: "Repayment occurrence", data: "Monthly"),
                      LoanOrPortfolioRowTile(
                          title: "Repayment start date", data: "21 Mar 2021"),
                      LoanOrPortfolioRowTile(
                          title: "Repayment start date", data: "21 Mar 2021"),
                      const SizedBox(
                        height: 21,
                      ),
                      const Divider(
                        color: kDarkPurple,
                      ),
                      LoanOrPortfolioRowTile(
                        title: "Negotiation",
                        data: "YES",
                        dataTextStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                                color: kGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                      ),
                      LoanOrPortfolioRowTile(
                        title: "Loan extension ",
                        data: "YES",
                        dataTextStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                                color: kGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                      ),
                      LoanOrPortfolioRowTile(
                        title: "Loan extension time",
                        data: "30 days",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 51,
                ),
                ButtonWidget(
                    onPressed: () {},
                    buttonColor: kGreen,
                    buttonText: "Reapply for this loan",
                    borderRadius: 8,
                    height: 50,
                    width: 347),
                const SizedBox(
                  height: 56,
                )
              ],
            ),
          ),
        ));
  }
}
