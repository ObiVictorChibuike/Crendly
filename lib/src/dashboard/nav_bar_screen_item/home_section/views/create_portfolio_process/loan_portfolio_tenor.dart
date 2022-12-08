import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/create_portfolio_process/loan_portfolio_repayment_option.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';

class CreateLoanPortFolioTenor extends StatefulWidget {
  const CreateLoanPortFolioTenor({Key? key}) : super(key: key);

  @override
  State<CreateLoanPortFolioTenor> createState() => _CreateLoanPortFolioTenorState();
}

class _CreateLoanPortFolioTenorState extends State<CreateLoanPortFolioTenor> {
  List<String> loanTenorOptions = ["7 Days", "15 Days", "1 Month", "3 Months","6 Months", "9 Months", "12 Months", "18 Months"];
  List<String> options = ["Yes", "No",];
  List<String> duration = [
    "Daily",
    "Weekly",
    "Monthly",
  ];
  String? selectedOption;
  String? selectedInterestRate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          title: LinearProgressIndicator(
            color: kGreen,
            value: 0.2,
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
                    child: Text("Loan Tenor", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(
                  height: 10,
                ),
                GroupButton(
                  options: GroupButtonOptions(spacing: 8, selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                      unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                      unselectedColor: Colors.transparent,
                      mainGroupAlignment: MainGroupAlignment.start,
                      unselectedBorderColor: Color(0xff2E4DBD),
                      crossGroupAlignment: CrossGroupAlignment.start,
                      borderRadius: BorderRadius.circular(25),
                      selectedColor: kLighterBackGroundColor,
                      selectedBorderColor: kLighterBackGroundColor,
                      buttonHeight: 44,
                      buttonWidth: MediaQuery.of(context).size.width / 3.7),
                  isRadio: true,
                  onSelected: (String value, index, isSelected) {},
                  buttons: loanTenorOptions,
                ),
                const SizedBox(height: 24,),
                Align(alignment: Alignment.centerLeft,
                  child: Text("Would you want interest in this loan offer?",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                ),
                const SizedBox(height: 15,),
                GroupButton(
                  options: GroupButtonOptions(spacing: 8, selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
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
                      selectedOption = value;
                    });
                  },
                  buttons: options,
                ),
                selectedOption == "Yes" ? Column(
                  children: [
                    const SizedBox(height: 40,),
                    DottedLine(dashColor: kBrightBackGroundColor,),
                    const SizedBox(height: 27,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Interest Rate", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50, width: double.maxFinite,
                      decoration: BoxDecoration(border: Border.all(color: kWhite, width: 0.7), borderRadius: BorderRadius.circular(8)),
                      child: TextButton(style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                        onPressed: () {

                        },
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedInterestRate ?? "Select interest rate", style: TextStyle(color: selectedInterestRate == null ? const Color(0xff868484) : kWhite, fontSize: 18),),
                            const Icon(Icons.keyboard_arrow_down, color: kWhite)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 17,),
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
                    const SizedBox(height: 64,)
                  ],
                ) : selectedOption == "No" ? Column(
                  children: [
                    const SizedBox(height: 40,),
                    DottedLine(dashColor: kBrightBackGroundColor,),
                    const SizedBox(height: 268,)
                  ],
                ) :
                const SizedBox(height: 138,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(onPressed: (){
                      Get.back();
                    },
                      buttonText: "Back", height: 50, buttonTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
                      width: MediaQuery.of(context).size.width / 5, buttonColor: kDarkBackGroundColor,
                    ),
                    ButtonWidget(onPressed: (){
                      selectedOption != null ? Get.to(()=>LoanPortfolioRepaymentOption()) : null;
                    },
                        buttonText: "Next", height: 50, buttonColor: selectedOption != null ? kGreen : Color(0xff383838),
                        width: MediaQuery.of(context).size.width / 3
                    ),
                  ],
                ),
                const SizedBox(height: 76,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
