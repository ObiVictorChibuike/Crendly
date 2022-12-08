import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class CustomLoanRequestWidget extends StatelessWidget {
  final String? creditScore;
  final String? loanAmount;
  final String? interestRate;
  final String? interestType;
  final String? repaymentAmount;
  final String? requestDate;
  final String? repaymentType;
  final String? duration;
  final String? repaymentStartDate;
  const CustomLoanRequestWidget({Key? key, this.creditScore, this.loanAmount, this.interestRate, this.interestType, this.repaymentAmount, this.requestDate, this.repaymentType, this.duration, this.repaymentStartDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Credit Score", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(creditScore!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const Divider(color: almostGrey,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Loan amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Interest type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(interestType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Repayment amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(repaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const Divider(color: almostGrey,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Request date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(requestDate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Request type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(repaymentType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(duration!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Repayment start date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
            Text(repaymentStartDate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
