import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
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
