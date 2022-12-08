import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/portfolio_details.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_and_portfolio_info_tile.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_or_portfolio_row_tile.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/portfolio_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class PortfolioInfo extends StatelessWidget {
  const PortfolioInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showPortfolioDetailsBottomSheet(BuildContext context){
      MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.5,
          children: [
            const SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text("Borrower Details", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                    child: Icon(Icons.clear, color: kOrange,))
              ],
            ),
            const SizedBox(height: 37,),
            Align(alignment: Alignment.center,
              child: Stack(
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
            ),
            const SizedBox(height: 14,),
            Align(alignment: Alignment.center,
              child: Text("Damilare Benson", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),),
            const SizedBox(height: 4,),
            Align(alignment: Alignment.center,
              child: Text("Loan requested on 12th Feb 2022", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            ),
            const SizedBox(height: 9,),
            Align(alignment: Alignment.center,
              child: RatingBar.builder(
                initialRating: 4, minRating: 1, direction: Axis.horizontal,
                allowHalfRating: true, unratedColor: Color(0xffC4C4C4),
                itemCount: 5, itemSize: 20, itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            const SizedBox(height: 39,),
            LoanOrPortfolioRowTile(title: "Credit Score", data: "75%",
              dataTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: kGreen, fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(height: 22,),
            const Divider(color: kBrighterBackGroundColor,),
            const SizedBox(height: 22,),
            LoanOrPortfolioRowTile(title: "Amount Loaned", data: "₦50,000"),
            LoanOrPortfolioRowTile(title: "Interest", data: "₦15,000"),
            LoanOrPortfolioRowTile(title: "Repayment Completed", data: "3/6",
              dataTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: kGreen, fontWeight: FontWeight.bold, fontSize: 16),),
            LoanOrPortfolioRowTile(title: "Defaults", data: "None"),
            const SizedBox(height: 56,)
          ]
      );
    }
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, color: kGreen,)),
                Text(
                  "Portfolio Info",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => PortfolioDetails()));
                  },
                  child: Text(
                    "View Details",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: kGreen,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            PortfolioInfoCard(
                portfolioAmount: "N450,000",
                portfolioStatus: "Running",
                statusColor: kLightOrange,
                loanType: "Payday Loan",
                loanAmount: "N50,000",
                noOfLoanees: "27",
                duration: "6 Months",
                interestRate: "15%"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Borrowers on Portfolio",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: (){
                showPortfolioDetailsBottomSheet(context);
              },
              child: LoanAndPortfolioInfoTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetPath.orangeHead,
                      theme: const SvgTheme(fontSize: 25),
                    ),
                  ),
                ),
                titleText: "Loan Repayment",
                subTitleText: "20 jan 2022 3:33pm",
                amount: "N52,500",
                trailingText: "6 Months",
                trailingTextStyle:
                    Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: kWhiteWithOpacity,
                          fontSize: 10,
                        ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: (){
                showPortfolioDetailsBottomSheet(context);
              },
              child: LoanAndPortfolioInfoTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetPath.orangeHead,
                      theme: const SvgTheme(fontSize: 25),
                    ),
                  ),
                ),
                titleText: "Loan Repayment",
                subTitleText: "20 jan 2022 3:33pm",
                amount: "N52,500",
                trailingText: "6 Months",
                trailingTextStyle:
                    Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: kWhiteWithOpacity,
                          fontSize: 10,
                        ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: (){
                showPortfolioDetailsBottomSheet(context);
              },
              child: LoanAndPortfolioInfoTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetPath.orangeHead,
                      theme: const SvgTheme(fontSize: 25),
                    ),
                  ),
                ),
                titleText: "Loan Repayment",
                subTitleText: "20 jan 2022 3:33pm",
                amount: "N52,500",
                trailingText: "6 Months",
                trailingTextStyle:
                    Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: kWhiteWithOpacity,
                          fontSize: 10,
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
