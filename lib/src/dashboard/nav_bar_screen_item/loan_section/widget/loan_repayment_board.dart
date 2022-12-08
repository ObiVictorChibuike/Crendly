import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanRepaymentBoardWidget extends StatelessWidget {
  final String? loanAmount;
  final String? duration;
  final String? interestRate;
  final String? repaymentAmount;
  final String? amountRepayment;
  final String? remainingPayment;
  const LoanRepaymentBoardWidget({Key? key, this.loanAmount, this.duration, this.interestRate, this.repaymentAmount, this.amountRepayment, this.remainingPayment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25), decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Loan Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
              const SizedBox(height: 5),
              Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite, fontWeight: FontWeight.w700),),
              const SizedBox(height: 17,),
              Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
              const SizedBox(height: 5),
              Text(duration!, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite, fontWeight: FontWeight.w700),),
              const SizedBox(height: 17,),
              Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
              const SizedBox(height: 5),
              Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite, fontWeight: FontWeight.w700),),
              const Divider(color: kDivider,)
            ],
          ),
          const SizedBox(width: 10,),
          Container(
            color: kWhite,width: 1, height: MediaQuery.of(context).size.height / 5,
          ),
          const SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Repayment Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
              const SizedBox(height: 5),
              Text(loanAmount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite, fontWeight: FontWeight.w700),),
              const SizedBox(height: 17,),
              Text("Amount  repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
              const SizedBox(height: 5),
              Text(duration!, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite, fontWeight: FontWeight.w700),),
              const SizedBox(height: 17,),
              Text("Remaining payment", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
              const SizedBox(height: 5),
              Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite, fontWeight: FontWeight.w700),),
              const Divider(color: kDivider,)
            ],
          ),
        ],
      ),
    );
  }
}
