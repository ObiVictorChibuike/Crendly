import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanOrPortfolioRowTile extends StatelessWidget {
  final String title;
  final String data;
  final TextStyle? dataTextStyle;
  const LoanOrPortfolioRowTile(
      {required this.title, required this.data, this.dataTextStyle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 138,
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kWhite, fontSize: 16)),
          ),
          Text(
            data,
            style: dataTextStyle ??
                Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
