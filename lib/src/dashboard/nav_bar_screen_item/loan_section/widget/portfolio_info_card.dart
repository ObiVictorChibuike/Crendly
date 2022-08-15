import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortfolioInfoCard extends StatelessWidget {
  final String portfolioAmount;
  final String portfolioStatus;
  final Color statusColor;
  final String loanType;
  final String loanAmount;
  final String noOfLoanees;
  final String duration;
  final String interestRate;

  const PortfolioInfoCard(
      {required this.portfolioAmount,
      required this.portfolioStatus,
      required this.statusColor,
      required this.loanType,
      required this.loanAmount,
      required this.noOfLoanees,
      required this.duration,
      required this.interestRate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 211,
      child: Card(
        color: kPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Portfolio Amount",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          portfolioAmount,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 20,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 39,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("Portfolio Status",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 10,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: 68,
                      height: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: statusColor)),
                      child: Center(
                        child: Text(
                          portfolioStatus,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 10,
                                  color: statusColor,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 112 / 37,
                  mainAxisSpacing: 14,
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Loan type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          loanType,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 14,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Loan amount",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          loanAmount,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 16,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "No of Loanees",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          noOfLoanees,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 16,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Duration",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          duration,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 14,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Interest Rate",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          interestRate,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 14,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
