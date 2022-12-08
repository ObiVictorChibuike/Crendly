import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class CompareLoanWidget extends StatelessWidget {
  final String? title;
  final String? repaymentPercentage;
  final String? amount;
  final String? duration;
  final String? payment;
  final String? lenderRep;
  const CompareLoanWidget({Key? key, this.title, this.repaymentPercentage, this.amount, this.duration, this.payment, this.lenderRep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff0A2069),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container( width: 280,
        padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xff0A2069), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(repaymentPercentage!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
                Image.asset(AssetPath.carbonMoney, height: 50, width: 50,),
              ],
            ),
            const SizedBox(height: 8,),
            const Divider(
              color: Color(0xff8095E0),
            ),
            const SizedBox(height: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                    const SizedBox(height: 5,),
                    Text(amount!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    const SizedBox(height: 15,),
                    Text("Payment", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                    const SizedBox(height: 5,),
                    Text(payment!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Duration", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                    const SizedBox(height: 5,),
                    Text(duration!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                    const SizedBox(height: 15,),
                    Text("Lender’s rep", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                    const SizedBox(height: 5,),
                    Text(lenderRep!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
