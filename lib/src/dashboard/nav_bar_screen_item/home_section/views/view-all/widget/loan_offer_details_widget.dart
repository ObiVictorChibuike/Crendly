import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanOfferDetailsWidget extends StatelessWidget {
  final String? loanType;
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
  final String? status;
  const LoanOfferDetailsWidget({Key? key, this.loanType, this.loanAmount, this.interestRate, this.interestType, this.loanTenor, this.repaymentAmount, this.totalRepaymentAmount, this.repaymentType, this.repaymentOccurance, this.repaymentStartDate, this.repaymentEndDate, this.negotiation, this.loanExtension, this.loanExtensionTime, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(18), decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kBlue),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Interest type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(interestType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan tenor", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanTenor!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total repayment \namount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(totalRepaymentAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 18,),
          const Divider(),
          const SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repaymentType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment occurrence", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repaymentOccurance!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment start date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repaymentStartDate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment end date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repaymentEndDate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 21,),
          const Divider(),
          const SizedBox(height: 18,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Negotiation", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(negotiation!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan extension", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanExtension!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan extension time", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanExtensionTime!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(status!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOrange, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 18,),
        ],
      ),
    );
  }
}
