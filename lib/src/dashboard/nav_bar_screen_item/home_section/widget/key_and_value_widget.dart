import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';

class KeyAndValueWidget extends StatelessWidget {
  final String? loanType;
  final String? loanAmount;
  final String? duration;
  final String? interestRate;
  final String? monthlyRepayment;
  final String? repaymentMethod;
  final String? interestAmount;
  const KeyAndValueWidget({Key? key, this.loanType, this.loanAmount, this.duration, this.interestRate, this.monthlyRepayment, this.repaymentMethod, this.interestAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Loan Type", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(loanType!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Loan Amount", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(loanAmount!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Duration", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(duration!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Interest Rate", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(interestRate!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Monthly repayment", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(monthlyRepayment!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Repayment Method", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(repaymentMethod!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text("Interest Amount", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                const Spacer(),
                Text(interestAmount!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        )
      ),
    );
  }
}


