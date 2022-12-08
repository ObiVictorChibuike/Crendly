import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class QuickLoanDetailsTile extends StatelessWidget {
  final String? title;
  final String? amount;
  final Widget? bottomWidget;
  final String? percentage;
  final String? paymentType;
  final String? duration;
  final String? rating;
  final Color? borderColor;
  final Widget? removeWidget;
  final Color? boxColor;
  const QuickLoanDetailsTile({Key? key,
    this.title,
    this.amount,
    this.bottomWidget,
    this.percentage,
    this.paymentType,
    this.duration,
    this.rating,
    this.borderColor,
    this.removeWidget,
    this.boxColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0),
          child: Container( width: double.maxFinite,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: boxColor ?? Color(0xff081952),
              borderRadius: BorderRadius.circular(8), border: Border.all(color: borderColor ?? Colors.transparent),),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),),
                        Text(percentage!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, fontSize: 24, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Image.asset(AssetPath.carbonMoney, height: 50, width: 50,),
                  ],
                ),
                const SizedBox(height: 8,),
                const Divider(),
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
                        Text(paymentType!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Duration", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                        const SizedBox(height: 5,),
                        Text(duration!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 15,),
                        Text("Rating", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                        const SizedBox(height: 5,),
                        Text(rating!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                bottomWidget ?? const SizedBox()
              ],
            ),
          ),
        ),
        Positioned(
          right: 0, top: 5,
          child: removeWidget ?? const SizedBox(),
        )
      ],
    );
  }
}
