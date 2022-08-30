import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';

class NegotiationTermWidget extends StatelessWidget {
  final String? interestRate;
  final String? interestType;
  final String? loanTenor;
  final String? repaymentFrequency;
  const NegotiationTermWidget({Key? key, this.interestRate, this.interestType, this.loanTenor, this.repaymentFrequency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 24.0, 17.0, 34.0), decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(interestRate!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Interest type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(interestType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Loan tenor", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(loanTenor!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
          const SizedBox(height: 13,),
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Repayment frequency", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
              Text(repaymentFrequency!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    );
  }
}
