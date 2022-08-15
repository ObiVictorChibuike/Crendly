import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:flutter/material.dart';

class LoanAndPortfolioCard extends StatelessWidget {
  final String loanType;
  final String totalAmount;
  final String rate;
  final String loanAmountOrTypeHeader;
  final String loanAmount;
  final String loanDuration;
  final String interestOrRepaymentMethod;
  final String interestAmountOrRepaymentMethodType;
  final String status;
  final Color statusColor;
  final void Function()? onTap;
  const LoanAndPortfolioCard(
      {required this.loanType,
      required this.totalAmount,
      required this.loanAmountOrTypeHeader,
      required this.rate,
      required this.loanAmount,
      required this.loanDuration,
      required this.interestOrRepaymentMethod,
      required this.interestAmountOrRepaymentMethodType,
      required this.status,
      required this.statusColor,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 174,
        child: Card(
          elevation: 2,
          color: kLightBackGroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      loanType,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 13),
                      width: 68,
                      height: 24,
                      decoration: BoxDecoration(
                          border: Border.all(color: statusColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(status,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: statusColor,
                                      fontSize: 10,
                                    )),
                      ),
                    )
                  ],
                ),
                RichText(
                  text: TextSpan(
                      text: 'N450,000.00 ',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: '15%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 10, color: kGreen))
                      ]),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          loanAmountOrTypeHeader,
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
                                  color: kWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Loan Duration",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          loanDuration,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: kWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          interestOrRepaymentMethod,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhiteWithOpacity),
                        ),
                        Text(
                          interestAmountOrRepaymentMethodType,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: kWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
