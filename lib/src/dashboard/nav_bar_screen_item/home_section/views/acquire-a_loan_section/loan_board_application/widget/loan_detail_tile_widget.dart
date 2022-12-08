import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanDetailTileWidget extends StatelessWidget {
  final String? title;
  final String? percentage;
  final String? amount;
  final String? paymentType;
  final String? duration;
  final String? interestOnLoan;
  final String? repayableAmount;
  final String? monthlyInterest;
  const LoanDetailTileWidget({Key? key, this.title, this.percentage, this.paymentType, this.amount, this.duration, this.interestOnLoan, this.repayableAmount, this.monthlyInterest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(8)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(AssetPath.carbonMoney, height: 50, width: 50,),
                  const SizedBox(width: 10,),
                  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Loan type", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                      Text(title!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                ],
              ),
              Text(percentage!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const Divider(color: kBrighterBackGroundColor,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amount", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                  const SizedBox(height: 5,),
                  Text(amount!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 19,),
                  Text("Payment", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                  const SizedBox(height: 5,),
                  Text(paymentType!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 19,),
                  Text("Repayable amount", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                  const SizedBox(height: 5,),
                  Text(repayableAmount!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Interest on loan", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                  const SizedBox(height: 5,),
                  Text(interestOnLoan!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 19,),
                  Text("Duration", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                  const SizedBox(height: 5,),
                  Text(duration!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 19,),
                  Text("Monthly Interest", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                  const SizedBox(height: 5,),
                  Text(monthlyInterest!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}
