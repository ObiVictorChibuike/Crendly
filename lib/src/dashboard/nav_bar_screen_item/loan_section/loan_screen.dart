import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:crendly/shared_widgets/call_to_action.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_and_portfolio_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loan_type_info.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 21, right: 21, top: 30),
            height: 460,
            width: 390,
            decoration: BoxDecoration(
                color: kLightBackGroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all()),
            child: Column(
              children: [
                const SizedBox(
                  height: 29,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: kGreen,
                    ),
                    Text(
                      'My Loans',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 133),
                Container(
                  color: kGreen,
                  width: 92,
                  height: 21,
                  child: Center(
                    child: Text('N250,000 repaid',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 10,
                            )),
                  ),
                ),
                Image.asset(AssetPath.chartGraph),
                const SizedBox(
                  height: 11,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xffFFBA7B),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Total Loans Taken',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 10, color: kWhite),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xff6DE7B4),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Total Loans Repaid',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 10, color: kWhite),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '25 Loans',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10,
                          color: kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 62,
                    ),
                    Text(
                      '24  Repaid',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10,
                          color: kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CallToAction(assetName: AssetPath.send, actionText: "Repay Loan"),
              const SizedBox(
                width: 41,
              ),
              CallToAction(
                  assetName: AssetPath.withdraw,
                  actionText: "Withdraw",
                  backgroundColor: kCtaColor,
                  textColor: kWhiteWithOpacity),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loans",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 20, color: kWhite, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(3),
                  color: kLightBackGroundColor,
                  child: TabBar(
                      onTap: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      labelColor: kDarkBackGroundColor,
                      unselectedLabelColor: kWhite,
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 14, color: kWhite),
                      indicator: BoxDecoration(
                          color: kOrange,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.0)),
                          border: Border.all(
                            color: kOrange,
                          )),
                      tabs: const [
                        Text(
                          'All Loans',
                        ),
                        Text(
                          'Running Loans',
                        ),
                        Text(
                          'Repaid Loans',
                        )
                      ]),
                ),
                const SizedBox(
                  height: 44,
                ),
                getLoanView(context, currentIndex)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getLoanView(BuildContext context, int index) {
  switch (index) {
    case 0:
      return AllLoans(context);

    case 1:
      return RunningLoans(context);

    case 2:
      return RepaidLoans(context);

    default:
      return Container();
  }
}

Widget AllLoans(BuildContext context) {
  return Column(
    children: [
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Running",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kLightOrange,
      ),
      const SizedBox(
        height: 13,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      const SizedBox(
        height: 13,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      )
    ],
  );
}

Widget RunningLoans(BuildContext context) {
  return LoanAndPortfolioCard(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
    },
    loanType: "Payday Loan(Amount repayable)",
    totalAmount: "N450,000.00",
    loanAmount: "N350,000.00",
    loanDuration: "6 Months",
    loanAmountOrTypeHeader: "Loan Amount",
    status: "Running",
    rate: "15%",
    interestOrRepaymentMethod: "Interest",
    interestAmountOrRepaymentMethodType: "N150,000",
    statusColor: kLightOrange,
  );
}

Widget RepaidLoans(BuildContext context) {
  return LoanAndPortfolioCard(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
    },
    loanType: "Payday Loan(Amount repayable)",
    totalAmount: "N450,000.00",
    loanAmount: "N350,000.00",
    loanDuration: "6 Months",
    loanAmountOrTypeHeader: "Loan Amount",
    status: "Repaid",
    rate: "15%",
    interestOrRepaymentMethod: "Interest",
    interestAmountOrRepaymentMethodType: "N150,000",
    statusColor: kGreen,
  );
}
