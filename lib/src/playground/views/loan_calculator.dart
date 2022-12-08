import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class PlayGroundLoanCalculator extends StatefulWidget {
  const PlayGroundLoanCalculator({Key? key}) : super(key: key);

  @override
  State<PlayGroundLoanCalculator> createState() => _PlayGroundLoanCalculatorState();
}

class _PlayGroundLoanCalculatorState extends State<PlayGroundLoanCalculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            backgroundColor: kDarkBackGroundColor, elevation: 0,
            leading: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.arrow_back_ios, color: kWhite,)
            ),
          ),
        )
    );
  }
}
