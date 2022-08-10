import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:crendly/shared_widgets/loan_type_info_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanTypeInfo extends StatelessWidget {
  const LoanTypeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: kGreen,
                    )),
                Text("Payday Loan",
                style: Theme.of(context).textTheme
                .bodyText2!.copyWith(
                  fontSize: 16,
                  color: kWhite,
                  fontWeight: FontWeight.bold
                ),),
                Text("View Details",  style: TextStyle(
                  decoration: TextDecoration.underline,
                    fontSize: 14,
                    color: kGreen,
                    fontWeight: FontWeight.bold
                ), )
              ],
            ),
            LoanTypeInfoCard(
                value: 0.75,
                percentageValue: "75%",
                amountPaid: "N350,000.00",
                remainingPayment: "N150,000.00",
                totalAmount: "N450,000.00",
                duration: "6 Months",
                interestRate: "15%",
                capital: "N350,000",
                interest: "N150,000",
                status: "Running",
                statusColor: kLightOrange)
          ],
        ),
      ),
    );
  }
}
