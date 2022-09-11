import 'package:crendly/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import '../../../../../constants/color_palette.dart';
import '../../../../../shared_widgets/customButton.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  bool isLoanCalculatorSelected = true;
  bool isAmount = false;
  bool isDuration = true;
  bool isInterest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
            height: MediaQuery.of(context).size.height / 2.2, width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 24),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
                      Text("Calculator", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 24, fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(8)),
                      height: 40, width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 1.5),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonWidget(
                                      onPressed: (){
                                        setState(() {
                                          isLoanCalculatorSelected = true;
                                        });
                                      },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: isLoanCalculatorSelected == true ? Colors.black : kWhite, fontWeight: FontWeight.w700
                                  ),
                                      buttonColor: isLoanCalculatorSelected == true ? kOrange : Colors.transparent, buttonText: "Loan Calculator",
                                      width: MediaQuery.of(context).size.width / 2.5, height: 35
                                  ),
                                  ButtonWidget(
                                      onPressed: (){
                                        setState(() {
                                          isLoanCalculatorSelected = false;
                                        });
                                      },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: isLoanCalculatorSelected == false ? Colors.black : kWhite,
                                      fontWeight: FontWeight.w700),
                                      buttonColor: isLoanCalculatorSelected == false ? kOrange : Colors.transparent, buttonText: "Income Calculator",
                                      width: MediaQuery.of(context).size.width / 2.5, height: 35
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 44,),
                    isLoanCalculatorSelected == true ? Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₦75,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 32),),
                                Text("Monthly Payment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₦22,500", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
                                Text("Interest", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 38,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₦125,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                                Text("Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("12 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                                Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ) : Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₦75,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 32),),
                                Text("Monthly Earnings", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₦22,500", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
                                Text("Total Interest", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 38,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₦125,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                                Text("Portfolio Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("12 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                                Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
              ],
            ),
          ),
          const SizedBox(height: 38,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                height: 100, width: 100,
                                decoration: BoxDecoration(color: Color(0xff1C046C), borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Icon(MdiIcons.cash, color: kWhite)
                                ),
                              ),
                            ),
                            Container(
                              height: 100, width: 100,
                              decoration: BoxDecoration(color: Color(0xff1C046C), borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Icon(Icons.access_time, color: kWhite,),
                              ),
                            ),
                            Container(
                              height: 100, width: 100,
                              decoration: BoxDecoration(color: Color(0xff1C046C), borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Icon(Icons.percent, color: kWhite,),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
