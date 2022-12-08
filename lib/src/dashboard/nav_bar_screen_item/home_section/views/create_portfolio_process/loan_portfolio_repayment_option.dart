import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/create_portfolio_process/loan_portfolio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';


class LoanPortfolioRepaymentOption extends StatefulWidget {
  const LoanPortfolioRepaymentOption({Key? key}) : super(key: key);

  @override
  State<LoanPortfolioRepaymentOption> createState() => _LoanPortfolioRepaymentOptionState();
}

class _LoanPortfolioRepaymentOptionState extends State<LoanPortfolioRepaymentOption> {
  List<String> repaymentOptions = ["Installment", "One-Off",];
  List<String> repaymentOccuranceOptions = ["Weekly", "Monthly",];
  List<String> duration = [
    "Daily",
    "Weekly",
    "Monthly",
  ];
  String? selectedRepaymentOption;
  String? selectedRepaymentOccuranceOptions;
  bool switchValue1 =  false;
  bool switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          title: LinearProgressIndicator(
            color: kGreen,
            value: 0.3,
          ), centerTitle: false,
          appBarLabel: Text(
            "Create a Loan Portfolio",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          onBackPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              children: [
                const SizedBox(height: 32,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Repayment Option", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(
                  height: 10,
                ),
                GroupButton(
                  options: GroupButtonOptions(spacing: 10, selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                      unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                      unselectedColor: Colors.transparent,
                      mainGroupAlignment: MainGroupAlignment.start,
                      unselectedBorderColor: Color(0xff2E4DBD),
                      crossGroupAlignment: CrossGroupAlignment.start,
                      borderRadius: BorderRadius.circular(25),
                      selectedColor: kLighterBackGroundColor,
                      selectedBorderColor: kLighterBackGroundColor,
                      buttonHeight: 44,
                      buttonWidth: MediaQuery.of(context).size.width / 2.4),
                  isRadio: true,
                  onSelected: (String value, index, isSelected) {
                    setState(() {
                      selectedRepaymentOption = value;
                    });
                  },
                  buttons: repaymentOptions,
                ),
                selectedRepaymentOption == "Installment" ? Column(
                  children: [
                    const SizedBox(height: 28,),
                    Align(alignment: Alignment.centerLeft,
                        child: Text("Repayment Option", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                    const SizedBox(height: 10,),
                    GroupButton(
                      options: GroupButtonOptions(spacing: 10, selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                          unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                          unselectedColor: Colors.transparent,
                          mainGroupAlignment: MainGroupAlignment.start,
                          unselectedBorderColor: Color(0xff2E4DBD),
                          crossGroupAlignment: CrossGroupAlignment.start,
                          borderRadius: BorderRadius.circular(25),
                          selectedColor: kLighterBackGroundColor,
                          selectedBorderColor: kLighterBackGroundColor,
                          buttonHeight: 44,
                          buttonWidth: MediaQuery.of(context).size.width / 2.4),
                      isRadio: true,
                      onSelected: (String value, index, isSelected) {
                        setState(() {
                          selectedRepaymentOccuranceOptions = value;
                        });
                      },
                      buttons: repaymentOccuranceOptions,
                    ),
                  ],
                ) : const SizedBox(),
                const SizedBox(height: 31,),
                DottedLine(dashColor: kBrighterBackGroundColor,),
                const SizedBox(height: 25,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Allow Loan negotiation.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                    CupertinoSwitch(value: switchValue1,
                        activeColor: switchValue1 == false ? kLightBackGroundColor : kWhite, thumbColor: switchValue1 == false ? kDarkBlue : kGreen,
                        onChanged: (value){
                      setState(() {
                        switchValue1 = value;
                      });
                    })
                  ],
                ),
                const SizedBox(height: 36,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Allow Loan extension", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                    CupertinoSwitch(value: switchValue2,
                        activeColor: switchValue2 == false ? kLightBackGroundColor : kWhite, thumbColor: switchValue2 == false ? kDarkBlue : kGreen,
                        onChanged: (value){
                          setState(() {
                            switchValue2 = value;
                          });
                        })
                  ],
                ),
                const SizedBox(height: 49,),
                switchValue1 == true && switchValue2 == true && selectedRepaymentOption == "One-Off"? Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Interest type", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                    const SizedBox(height: 17,),
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
                    const SizedBox(height: 150,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(onPressed: (){
                          Get.back();
                        },
                          buttonText: "Back", height: 50, buttonTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
                          width: MediaQuery.of(context).size.width / 5, buttonColor: kDarkBackGroundColor,
                        ),
                        ButtonWidget(onPressed: (){
                          Get.to(()=> const LoanPortfolio());
                        },
                            buttonText: "Next", height: 50, buttonColor: selectedRepaymentOption != null ? kGreen : Color(0xff383838),
                            width: MediaQuery.of(context).size.width / 3
                        ),
                      ],
                    ),
                    const SizedBox(height: 76,)
                  ],
                ) :   switchValue1 == true && switchValue2 == true && selectedRepaymentOption == "Installment"?
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Interest type", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                        const SizedBox(height: 17,),
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
                        const SizedBox(height: 150,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(onPressed: (){
                              Get.back();
                            },
                              buttonText: "Back", height: 50, buttonTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
                              width: MediaQuery.of(context).size.width / 5, buttonColor: kDarkBackGroundColor,
                            ),
                            ButtonWidget(onPressed: (){
                              Get.to(()=> const LoanPortfolio());
                            },
                                buttonText: "Next", height: 50, buttonColor: selectedRepaymentOption != null ? kGreen : Color(0xff383838),
                                width: MediaQuery.of(context).size.width / 3
                            ),
                          ],
                        ),
                        const SizedBox(height: 76,)
                      ],
                    ) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
