import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/call_to_action.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_and_portfolio_card.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/widget/loan_repayment_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loan_type_info.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  int currentIndex = 0;
  bool? isFullRepayment;

  void showRepayLoanBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.3,
        children: [
          StatefulBuilder(builder: (context, mySetState){
            return Column(children: [
              const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Repay Loan", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite,fontSize: 20, fontWeight: FontWeight.w700),),
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.clear, color: kOrange,)),
                ],
              ),
              const SizedBox(height: 48,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: (){
                    mySetState(() {
                      isFullRepayment = true;
                    });
                  },
                    child: Container(
                      height: 44, width: MediaQuery.of(context).size.width / 2.4,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: isFullRepayment == true ? kBlue : kWhite), color: isFullRepayment == true ? kBlue : Colors.transparent),
                      child: Center(
                        child: Text("Full Repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16,),),
                      ),
                    ),
                  ),
                  GestureDetector(onTap: (){
                    mySetState(() {
                      isFullRepayment = false;
                    });
                  },
                    child: Container(
                      height: 44, width: MediaQuery.of(context).size.width / 2.4,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: isFullRepayment == false ? kBlue : kWhite), color: isFullRepayment == false ? kBlue : Colors.transparent),
                      child: Center(
                        child: Text("Part Repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                child: Column(
                  children: [
                    LoanRepaymentBoardWidget(
                      loanAmount: "₦350,000.00",
                      duration: "6 Months",
                      interestRate: "15%",
                      repaymentAmount: "₦450,000.00",
                      amountRepayment: "₦350,000.00",
                      remainingPayment: "₦150,000.00",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              isFullRepayment == true ?
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You will be make a full repayment of N150,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                  Text("Funds will be deducted from your wallet", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGrey, fontSize: 14, fontWeight: FontWeight.w700),)
                ],
              ) :
              isFullRepayment == false ?
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormFieldWidget(
                    labelTitle: "Enter loan amount you want to repay.",
                    hintText: "Amount",
                    filledColor: kLightBackGroundColor,
                  ),
                  const SizedBox(height: 12,),
                  Text("Funds will be deducted from your wallet", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGrey, fontSize: 12),)
                ],
              )
                  : const SizedBox(),
              SizedBox(height: isFullRepayment == true ? 88 : isFullRepayment == false ? 21 : 150,),
              ButtonWidget(onPressed: (){}, buttonText: "Make repayment", height: 50, width: double.maxFinite, buttonColor: kGreen,),
              const SizedBox(height: 68,),
            ],);
          })
        ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 21, right: 21, top: 30), height: MediaQuery.of(context).size.height / 2, width: 390,
            decoration: BoxDecoration(color: kLightBackGroundColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)), border: Border.all()),
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: kGreen, width: 92, height: 21,
                  child: Center(child: Text('N250,000 repaid', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10,)),),
                ),
                Image.asset(AssetPath.chartGraph),
                const SizedBox(height: 11,),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(width: 50,),
                      CircleAvatar(radius: 4, backgroundColor: Color(0xffFFBA7B),),
                      const SizedBox(width: 4,),
                      Text(
                        'Total Loans Taken',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 10, color: kWhite),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xff6DE7B4),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Total Loans Repaid',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 10, color: kWhite),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '25 Loans',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10,
                          color: kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 62,
                    ),
                    Text(
                      '24  Repaid',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10,
                          color: kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
        Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>showRepayLoanBottomSheet(context),
                      child: CallToAction(assetName: AssetPath.send, actionText: "Repay Loan")),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Loans",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize: 20, color: kWhite, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 14,),
                        Container(padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                          height: 40, decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.circular(9)),
                          child: TabBar(
                              onTap: (index) {
                                setState(() {
                                  currentIndex = index;
                                });
                              }, indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: kDarkBackGroundColor,
                              unselectedLabelColor: kWhite,
                              labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                              unselectedLabelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12, color: kWhite),
                              indicator: BoxDecoration(color: kOrange, borderRadius: const BorderRadius.all(Radius.circular(9.0)), border: Border.all(color: kOrange,)),
                              tabs: const [
                                Text('All Loans',),
                                Text('Running Loans',),
                                Text('Repaid Loans',)
                              ]),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        getLoanView(context, currentIndex)
                      ],
                    ),
                  )
                ],
              ),
            )
        )
        ],
      ),
    );
  }
}

Widget getLoanView(BuildContext context, int index) {
  switch (index) {
    case 0:
      return AllLoans(context);

    case 1:
      return RunningLoans(context);

    case 2:
      return RepaidLoans(context);

    default:
      return Container();
  }
}

Widget AllLoans(BuildContext context) {
  return Column(
    children: [
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Running",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kLightOrange,
      ),
      const SizedBox(
        height: 13,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      const SizedBox(
        height: 13,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      const SizedBox(height: 139,)
    ],
  );
}

Widget RunningLoans(BuildContext context) {
  return Column(
    children: [
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Running",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kLightOrange,
      ),
      const SizedBox(height: 189,)
    ],
  );
}

Widget RepaidLoans(BuildContext context) {
  return Column(
    children: [
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      LoanAndPortfolioCard(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoanTypeInfo()));
        },
        loanType: "Payday Loan(Amount repayable)",
        totalAmount: "N450,000.00",
        loanAmount: "N350,000.00",
        loanDuration: "6 Months",
        loanAmountOrTypeHeader: "Loan Amount",
        status: "Repaid",
        rate: "15%",
        interestOrRepaymentMethod: "Interest",
        interestAmountOrRepaymentMethodType: "N150,000",
        statusColor: kGreen,
      ),
      const SizedBox(height: 158,)
    ],
  );
}
