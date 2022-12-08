import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';


class LoanAndPortfolioInfoTile extends StatelessWidget {
  final Widget leading;
  final String titleText;
  final String subTitleText;
  final String amount;
  final String trailingText;
  final TextStyle trailingTextStyle;

  const LoanAndPortfolioInfoTile(
      {required this.leading,
      required this.titleText,
      required this.subTitleText,
      required this.amount,
      required this.trailingText,
      required this.trailingTextStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: kLightBackGroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: kLightBackGroundColor)),
      leading: leading,
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitleText,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: kWhiteWithOpacity,
              fontSize: 10,
            ),
      ),
      trailing: Column(
        children: [
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: kLightOrange,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            trailingText,
            style: trailingTextStyle,
          )
        ],
      ),
    );
  }
}
