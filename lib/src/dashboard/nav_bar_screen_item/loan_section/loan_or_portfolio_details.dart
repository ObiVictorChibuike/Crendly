import 'package:flutter/material.dart';

import '../../../../constants/color_palette.dart';
import '../../../../shared_widgets/customButton.dart';

class LoanOrPortfolioDetails extends StatelessWidget {
  const LoanOrPortfolioDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, color: kLightGreen)),
          Expanded(
            child: Center(
              child: Text(
                "Loan Details",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ]),
        Container(
          width: 358,
          height: 677,
          decoration: BoxDecoration(
              color: kBlue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBlue)),
          child: Column(
            children: [],
          ),
        ),
        const SizedBox(
          height: 51,
        ),
        ButtonWidget(
            onPressed: () {},
            buttonColor: kGreen,
            buttonText: "Reapply for this loan",
            borderRadius: 8,
            height: 50,
            width: 347),
      ],
    ));
  }
}
