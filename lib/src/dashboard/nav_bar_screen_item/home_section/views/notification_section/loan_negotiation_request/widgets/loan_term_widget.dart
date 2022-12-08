import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanTermWidget extends StatelessWidget {
  final String? loanType;
  final String? loanAmount;
  final String? interestRate;
  final String? repayment;
  final String? loanTenor;
  final String? totalRepaymentAmount;
  const LoanTermWidget({Key? key, this.loanType, this.loanAmount, this.interestRate, this.repayment, this.loanTenor, this.totalRepaymentAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30), decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kBlue,),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Loan type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Loan amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repayment!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Loan tenor", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanTenor!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total repayment amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(totalRepaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    );
  }
}
