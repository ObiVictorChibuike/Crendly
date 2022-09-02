import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/loan_details.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_and_portfolio_info_tile.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_type_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoanTypeInfo extends StatelessWidget {
  const LoanTypeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: kGreen,
                    )),
                Text(
                  "Payday Loan",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => LoanDetails()));
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
            LoanTypeInfoCard(
                value: 0.75,
                percentageValue: "75%",
                amountPaid: "N350,000.00",
                remainingPayment: "N150,000.00",
                totalAmount: "N450,000.00",
                duration: "6 Months",
                interestRate: "15%",
                capital: "N350,000",
                interest: "N150,000",
                status: "Running",
                statusColor: kLightOrange),
            const SizedBox(
              height: 38,
            ),
            LoanAndPortfolioInfoTile(
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: kRedPink,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: kLightBackGroundColor,
                    child: SvgPicture.asset(AssetPath.send, color: kRedPink),
                  ),
                ),
                titleText: "Loan Repayment",
                subTitleText: "20 jan 2022 3:33pm",
                amount: "N52,500",
                trailingText: "Scheduled",
                trailingTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: kRedPink)),
            const SizedBox(
              height: 8,
            ),
            LoanAndPortfolioInfoTile(
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: kRedPink,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: kLightBackGroundColor,
                    child: SvgPicture.asset(AssetPath.send, color: kRedPink),
                  ),
                ),
                titleText: "Loan Repayment",
                subTitleText: "20 jan 2022 3:33pm",
                amount: "N52,500",
                trailingText: "Scheduled",
                trailingTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: kRedPink)),
            const SizedBox(
              height: 8,
            ),
            LoanAndPortfolioInfoTile(
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: kRedPink,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: kLightBackGroundColor,
                    child: SvgPicture.asset(AssetPath.send, color: kRedPink),
                  ),
                ),
                titleText: "Loan Repayment",
                subTitleText: "20 jan 2022 3:33pm",
                amount: "N52,500",
                trailingText: "Scheduled",
                trailingTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: kRedPink)),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
