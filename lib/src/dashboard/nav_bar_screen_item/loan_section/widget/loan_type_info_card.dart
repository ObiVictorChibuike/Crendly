import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanTypeInfoCard extends StatelessWidget {
  final double value;
  final String percentageValue;
  final String amountPaid;
  final String remainingPayment;
  final String totalAmount;
  final String duration;
  final String interestRate;
  final String capital;
  final String interest;
  final String status;
  final Color statusColor;

  const LoanTypeInfoCard(
      {required this.value,
      required this.percentageValue,
      required this.amountPaid,
      required this.remainingPayment,
      required this.totalAmount,
      required this.duration,
      required this.interestRate,
      required this.capital,
      required this.interest,
      required this.status,
      required this.statusColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 211,
      child: Card(
        color: kBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 64,
                        width: 64,
                        child: CircularProgressIndicator(
                          backgroundColor: kCircularProgressBackgroundColor,
                          value: value,
                          color: kGreen,
                        ),
                      ),
                      Positioned(
                          top: 20,
                          left: 20,
                          child: Text(
                            percentageValue.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                          ))
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paid",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color: kWhite,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                amountPaid.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: kWhite),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: kLightPurple,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Remaining payment",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 10,
                                      color: kWhite,
                                    ),
                              ),
                              Text(
                                remainingPayment.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 14, color: kWhite),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Amount",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: kWhite,
                              fontSize: 10,
                            ),
                      ),
                      Text(
                        totalAmount,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: kWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Duration",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: kWhite,
                              fontSize: 10,
                            ),
                      ),
                      Text(
                        duration,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: kWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Interest rate",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: kWhite,
                              fontSize: 10,
                            ),
                      ),
                      Text(
                        interestRate,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: kWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Capital",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhite),
                        ),
                        Text(capital,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 10, color: kWhite))
                      ],
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: kLightPurple,
                    ),
                    Column(
                      children: [
                        Text(
                          "Interest",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10, color: kWhite),
                        ),
                        Text(interest,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 10, color: kWhite))
                      ],
                    ),
                    const SizedBox(
                      width: 64,
                    ),
                    Text("Loan Status", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10, color: kWhite, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10,),
                    Container(
                      width: 68,
                      height: 24,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(color: statusColor)),
                      child: Center(
                        child: Text(
                          status,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
