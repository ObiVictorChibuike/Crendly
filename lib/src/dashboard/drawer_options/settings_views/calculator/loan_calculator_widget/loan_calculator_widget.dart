import 'package:crendly/app/constants/color_palette.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class LoanCalculatorWidget extends StatelessWidget {
  final String? loanAmount;
  final String? duration;
  final String? totalPayment;
  final String? monthlyPayment;
  final String? interestRate;
  final String? interestAmount;
  const LoanCalculatorWidget({Key? key, this.loanAmount, this.duration, this.totalPayment, this.monthlyPayment, this.interestRate, this.interestAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: kWhite, dashPattern: [4, 2], radius: Radius.circular(8), borderType: BorderType.RRect,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 16),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Loan Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 5,),
                      Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 5,),
                      Text(duration!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Total Payment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 5,),
                      Text(totalPayment!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Monthly Payment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 5,),
                      Text(monthlyPayment!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 5,),
                      Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Interest amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 5,),
                      Text(interestAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
