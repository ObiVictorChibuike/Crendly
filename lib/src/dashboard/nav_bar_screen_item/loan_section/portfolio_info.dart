import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_and_portfolio_info_tile.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/portfolio_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PortfolioInfo extends StatelessWidget {
  const PortfolioInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: kGreen,
                    )),
                Text(
                  "Portfolio Info",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View Details",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: kGreen,
                      fontWeight: FontWeight.bold),
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
            LoanAndPortfolioInfoTile(
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
            const SizedBox(
              height: 8,
            ),
            LoanAndPortfolioInfoTile(
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
            const SizedBox(
              height: 8,
            ),
            LoanAndPortfolioInfoTile(
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
          ],
        ),
      ),
    );
  }
}
