import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/get_a_loan.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import 'loan_calculator_widget/loan_calculator_widget.dart';


class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  String? selectedOption = "Loan Calculator";
  bool isLoanCalculatorSelected = true;
  bool isAmount = false;
  bool isDuration = true;
  bool isInterest = false;
  double _lowerValue = 0;
  double _upperValue = 40.0;
  List<String> duration = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  void showLoanDetailBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.6,
        children: [
          const SizedBox(height: 5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(selectedOption == "Loan Calculator" ? "Loan Summary" : "Income Summary", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                  child: Icon(Icons.clear, color: kOrange,))
            ],
          ),
          const SizedBox(height: 4,),
          Align(alignment: Alignment.center,
            child: Text("See a breakdown of what you how \nand when your repayment is due.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
          ),
          const SizedBox(height: 38,),
          LoanCalculatorWidget(
            loanAmount: "₦125,000",
            duration: "12 Months",
            totalPayment: "₦175,000",
            monthlyPayment: "₦25,500",
            interestRate: "15%",
            interestAmount: "₦50,000",
          ),
          const SizedBox(height: 13,),
          Text("You will be charged a fee of ₦100 +1.5% \nof the total amount.", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12, color: kWhite),),
          const SizedBox(height: 64,),
          ButtonWidget(onPressed: (){
            selectedOption == "Loan Calculator" ? Get.to(()=>GetALoan()) : null;
          }, buttonText: selectedOption == "Loan Calculator" ? "Get this Loan" : "Create Loan Portfolio", height: 50, width: double.maxFinite, buttonColor: kGreen,),
          const SizedBox(height: 46,),
        ]
    );
  }
  
  
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
                                          selectedOption = "Loan Calculator";
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
                                          selectedOption = "Income Calculator";
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
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 38,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isAmount = true;
                                      isDuration = false;
                                      isInterest = false;
                                    });
                                  },
                                  child: Container(
                                    height: 100, width: 100,
                                    decoration: BoxDecoration(color: isAmount == true ? kBlue : Color(0xff1C046C), borderRadius: BorderRadius.circular(8)),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(MdiIcons.cash, color: kWhite),
                                        Text("Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),)
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isAmount = false;
                                      isDuration = true;
                                      isInterest = false;
                                    });
                                  },
                                  child: Container(
                                    height: 100, width: 100,
                                    decoration: BoxDecoration(color: isDuration == true ? kBlue : Color(0xff1C046C), borderRadius: BorderRadius.circular(8)),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time, color: kWhite,),
                                        Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),)
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isAmount = false;
                                      isDuration = false;
                                      isInterest = true;
                                    });
                                  },
                                  child: Container(
                                    height: 100, width: 100,
                                    decoration: BoxDecoration(color: isInterest == true ? kBlue : Color(0xff1C046C), borderRadius: BorderRadius.circular(8)),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.percent, color: kWhite,),
                                        Text("Interest", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Text(isAmount == true ? "Amount" : isDuration == true ? "Duration" : isInterest == true ? "Interest" : "",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: kWhite),),
                    const SizedBox(height: 16,),
                    Align(alignment: Alignment.center,
                      child: GroupButton(
                        options: GroupButtonOptions(
                            spacing: 10,
                            selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                            unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                            unselectedColor: Colors.transparent,
                            mainGroupAlignment: MainGroupAlignment.start,
                            unselectedBorderColor: kWhite,
                            selectedBorderColor: kLighterBackGroundColor,
                            crossGroupAlignment: CrossGroupAlignment.start,
                            selectedColor: kLighterBackGroundColor,
                            borderRadius: BorderRadius.circular(25),
                            buttonHeight: 44,
                            buttonWidth: MediaQuery.of(context).size.width / 3.8),
                        isRadio: true,
                        onSelected: (String value, index, isSelected) {},
                        buttons: duration
                      ),
                    ),
                    const SizedBox(height: 46,),
                    Text("12 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 40, fontWeight: FontWeight.w700),),
                    const SizedBox(height: 20,),
                    RangeSliderFlutter(
                      // key: Key('3343'),
                      values: [_lowerValue, _upperValue],
                      rangeSlider: false,
                      tooltip: RangeSliderFlutterTooltip(
                        alwaysShowTooltip: false,
                        disabled: true
                      ),
                      max: 20000,
                      textPositionTop: -100,
                      handlerHeight: 30,
                      trackBar:RangeSliderFlutterTrackBar(
                        activeTrackBarHeight: 10,
                        inactiveTrackBarHeight: 10,
                        activeTrackBar: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                          gradient: LinearGradient(colors: orangeGradient),
                        ),
                        inactiveTrackBar: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff081952)
                        ),
                      ),
                      min: 0, fontSize: 15,
                      textBackgroundColor:Colors.deepOrangeAccent,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        _lowerValue = lowerValue;
                        _upperValue = upperValue;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 56,),
                    ButtonWidget(onPressed: (){
                      isInterest != true ? null : showLoanDetailBottomSheet(context);
                    }, buttonText: "Continue" , height: 50, width: double.maxFinite, buttonColor: isInterest == true ? kGreen : kDisableColor,),
                    const  SizedBox(height: 115,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
