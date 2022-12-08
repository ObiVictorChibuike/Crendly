import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanPortfolioDetailsWidget extends StatelessWidget {
  final String? loanType;
  final String? portfolioAmount;
  final String? loanAvailableTo;
  final String? loanAmount;
  final String? interestRate;
  final String? interestType;
  final String? loanTenor;
  final String? repaymentAmount;
  final String? totalRepaymentAmount;
  final String? repaymentType;
  final String? repaymentOccurance;
  final String? repaymentStartDate;
  final String? repaymentEndDate;
  final String? negotiation;
  final String? loanExtension;
  final String? loanExtensionTime;
  const LoanPortfolioDetailsWidget({Key? key, this.loanType, this.portfolioAmount, this.loanAvailableTo, this.loanAmount, this.interestRate, this.interestType, this.loanTenor, this.repaymentAmount, this.totalRepaymentAmount, this.repaymentType, this.repaymentOccurance, this.repaymentStartDate, this.repaymentEndDate, this.negotiation, this.loanExtensionTime, this.loanExtension}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 31),
      decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(loanType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Portfolio amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(portfolioAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan available to", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(loanAvailableTo!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Interest type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(interestType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan tenor", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(loanTenor!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(repaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total repayment amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(totalRepaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total repayment amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(totalRepaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 16,),
          const Divider(),
          const SizedBox(height: 16,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(repaymentType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment occurance", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(repaymentOccurance!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment start date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(repaymentStartDate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment end date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(repaymentEndDate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 16,),
          const Divider(),
          const SizedBox(height: 16,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Negotiation", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(negotiation!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: negotiation == "YES" ? kGreen : kRedPink, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan extension", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(loanExtension!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: loanExtension == "YES" ? kGreen : kRedPink, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan extension time", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              Text(loanExtensionTime!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    );
  }
}
