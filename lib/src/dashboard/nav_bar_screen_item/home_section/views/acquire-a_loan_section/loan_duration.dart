import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../shared_widgets/custom_buttom_sheet.dart';
import '../../widget/custom_slider.dart';
import '../../widget/key_and_value_widget.dart';
import '../../widget/widget_utils.dart';
import 'complete_profile_details.dart';
class LoanDuration extends StatefulWidget {
  const LoanDuration({Key? key}) : super(key: key);

  @override
  State<LoanDuration> createState() => _LoanDurationState();
}

class _LoanDurationState extends State<LoanDuration> {

  void showInstallmentDetailLoanSummaryBottomShoot(BuildContext context) {
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height / 1.3,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("Loan Summary", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
              const Spacer(),
              IconButton(onPressed: () {Get.back();},
                icon: Icon(Icons.clear, color: kOrange,size: 20,),),
            ],
          ),
          Text("Fusce lacinia vulputate gravida massa nibh faucibus lorem vel etiam. ", textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
          const SizedBox(height: 30,),
          DottedBorder(color: Color(0xffC1CDF6), dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
              child: Column(
                children: [
                  KeyAndValueWidget(
                    loanType: "Payday ",
                    loanAmount: "₦125,000",
                    duration: "12 Months",
                    interestRate: "15%",
                    monthlyRepayment: "₦25,500",
                    repaymentMethod: "Installment",
                    interestAmount: "₦50,000",
                  ),
                ],
              )),
          const SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
              child: Text("You will be charged a fee of ₦100 +1.5% \nof the total amount.",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),)),
          const SizedBox(height: 20,),
          ButtonWidget(onPressed: (){
            Get.back();
            Get.to(()=> const CompleteProfileDetails());
          },
              buttonText: "Get this Loan", buttonColor: kGreen,
              height: 50, width: double.maxFinite
          ),
          const SizedBox(height: 30,),
        ]
    );
  }

  void showOneOffDetailLoanSummaryBottomShoot(BuildContext context) {
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height / 1.3,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("Loan Summary", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
              const Spacer(),
              IconButton(onPressed: () {Get.back();},
                icon: Icon(Icons.clear, color: kOrange,size: 20,),),
            ],
          ),
          Text("Fusce lacinia vulputate gravida massa nibh faucibus lorem vel etiam. ", textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
          const SizedBox(height: 30,),
          DottedBorder(color: Color(0xffC1CDF6), dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
              child: Column(
                children: [
                  KeyAndValueWidget(
                    loanType: "Payday ",
                    loanAmount: "₦125,000",
                    duration: "12 Months",
                    interestRate: "15%",
                    monthlyRepayment: "₦25,500",
                    repaymentMethod: "Installment",
                    interestAmount: "₦50,000",
                  ),
                ],
              )),
          const SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
              child: Text("You will be charged a fee of ₦100 +1.5% \nof the total amount.",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),)),
          const SizedBox(height: 20,),
          ButtonWidget(onPressed: (){
            Get.back();
            Get.to(()=> const CompleteProfileDetails());
          },
              buttonText: "Get this Loan", buttonColor: kGreen,
              height: 50, width: double.maxFinite
          ),
          const SizedBox(height: 30,),
        ]
    );
  }
  bool? isInstallment;
  String? selectedValue;
  List<String> loanOptions = ["7 Days", "15 Days", "1 Month", "3 Months", "6 Months", "9 Months", "12 Months", "18 Months"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(color: kGreen, value: 0.5,),
            appBarLabel: Text("Get a Loan", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            decorationImagePath: AssetPath.fullTag,
            onBackPressed: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 24, right: 24),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GroupButton(
                    options: GroupButtonOptions(
                        spacing: 8,
                        selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                        unselectedTextStyle: Theme.of(context).textTheme.bodyText2
                            ?.copyWith(color: kWhite, fontSize: 16),
                        unselectedColor: Colors.transparent,
                        mainGroupAlignment: MainGroupAlignment.start,
                        unselectedBorderColor: Color(0xff2E4DBD),
                        crossGroupAlignment: CrossGroupAlignment.start,
                        borderRadius: BorderRadius.circular(25),
                        selectedColor: const Color(0xff8095E0),
                        buttonHeight: 40,
                        buttonWidth: MediaQuery.of(context).size.width / 3.7),
                    isRadio: false,
                    onSelected: (String value, index, isSelected) {},
                    buttons: loanOptions,
                  ),
                  const SizedBox(height: 30,),
                  Text("How much are you applying for?", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16),),
                  const SizedBox(height: 10,),
                  GroupButton(
                    options: GroupButtonOptions(
                        spacing: 8,
                        selectedTextStyle: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: kWhite, fontSize: 16),
                        unselectedTextStyle: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: kWhite, fontSize: 16),
                        unselectedColor: Colors.transparent,
                        mainGroupAlignment: MainGroupAlignment.start,
                        unselectedBorderColor: Color(0xff2E4DBD),
                        crossGroupAlignment: CrossGroupAlignment.start,
                        borderRadius: BorderRadius.circular(25),
                        selectedColor: const Color(0xff8095E0),
                        buttonHeight: 35,
                        buttonWidth: MediaQuery.of(context).size.width / 2.4),
                    isRadio: false,
                    onSelected: (String value, index, isSelected) {
                      if (index == 0 && value == "Installment") {
                        setState(() {
                          isInstallment = isSelected;
                          selectedValue = value;
                        });
                      } else {
                        setState(() {
                          isInstallment = false;
                          selectedValue = null;
                        });
                      }
                    },
                    buttons: ["Installment", "One-Off"],
                  ),
                  const SizedBox(height: 30,),
                  isInstallment == true ? Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Divider(
                        color: kBlue,
                      ),
                      const SizedBox(height: 20,),
                      Text("How often you want to make payment?", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                      const SizedBox(height: 20,),
                      GroupButton(
                        options: GroupButtonOptions(
                            spacing: 8,
                            selectedTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kWhite, fontSize: 16),
                            unselectedTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kWhite, fontSize: 16),
                            unselectedColor: Colors.transparent,
                            mainGroupAlignment: MainGroupAlignment.start,
                            unselectedBorderColor: Color(0xff2E4DBD),
                            crossGroupAlignment: CrossGroupAlignment.start,
                            borderRadius: BorderRadius.circular(25),
                            selectedColor: const Color(0xff8095E0),
                            buttonHeight: 35,
                            buttonWidth: MediaQuery.of(context).size.width / 3.7),
                        isRadio: false,
                        onSelected: (String value, index, isSelected) {
                          if (index == 0 && value == "Installment") {
                            setState(() {
                              isInstallment = true;
                            });
                          } else {
                            setState(() {
                              isInstallment = false;
                            });
                          }
                        },
                        buttons: ["Daily", "Weekly", "Monthly"],
                      ),
                      const SizedBox(height: 35,),
                      Text("How much interest is fine by you?", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 35,),
                    ],
                  ) : isInstallment == false ? Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Divider(
                        color: kBlue,
                      ),
                      const SizedBox(height: 20,),
                      Text("Date you are to make payment.", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                      const SizedBox(height: 20,),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhite, width: 0.7),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                          onPressed: () {},
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("23/4/2022", style: TextStyle(color: kWhite, fontSize: 14),
                              ),
                              const Icon(Icons.calendar_today_outlined, color: kOrange)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 35,),
                      Text("How much interest is fine by you?", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 12),),
                      const SizedBox(height: 35,),
                    ],
                  ) : const SizedBox(),
                  const SizedBox(height: 10,),
                  Text("Interest rate", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 12, fontWeight: FontWeight.w400),),
                  Text("${initialPercentage}%", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 40, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                _drawSlider(),
                const SizedBox(height: 80,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(onPressed: (){
                        Get.back();
                      },
                          buttonText: "Back", height: 50, buttonTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
                          width: MediaQuery.of(context).size.width / 5, buttonColor: kDarkBackGroundColor,
                      ),
                      isInstallment == true? ButtonWidget(onPressed: (){
                        showInstallmentDetailLoanSummaryBottomShoot(context);
                      },
                          buttonText: "Continue", height: 50, buttonColor: kGreen,
                          width: MediaQuery.of(context).size.width / 3
                      ) : isInstallment == false ? ButtonWidget(onPressed: (){
                        showOneOffDetailLoanSummaryBottomShoot(context);
                      },
                          buttonText: "Continue", height: 50, buttonColor: kGreen,
                          width: MediaQuery.of(context).size.width / 3
                      ) : ButtonWidget(onPressed: (){},
                          buttonText: "Next", height: 50, buttonColor: const Color(0xff383838),
                          width: MediaQuery.of(context).size.width / 3
                      )
                    ],
                  ),
                  const SizedBox(height: 80,),
                ],
              ),
            ),
          ),
        )
    );
  }
  int initialPercentage = 70;
  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : WeightSlider(
            minValue: 1,
            maxValue: 110,
            value: initialPercentage,
            onChanged: (val){
              setState(() {
                initialPercentage = val;
              });
            },
            width: constraints.maxWidth,
          );
        },
      ),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget? child;

  const WeightBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(40.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            gradient: LinearGradient(colors: [
              Color(0xff000515),
              Color(0xff082998),
              Color(0xff000515),
            ]),
            borderRadius: BorderRadius.circular(screenAwareSize(50.0, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        ),
      ],
    );
  }
}
