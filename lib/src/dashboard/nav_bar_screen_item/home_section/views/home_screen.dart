import 'dart:async';
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/app/shared_widgets/custom_pincode_field.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/invite/invite_screen.dart';
import 'package:crendly/src/dashboard/drawer_options/settings_views/statement/statement_screen.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/create_portfolio_process/create_a_loan_portfolio.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/notification.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/widget/transaction_pin_bottomsheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../drawer_options/settings_views/calculator/loan_calculator.dart';
import '../../../drawer_options/settings_views/my_account/bank_account/bank_account.dart';
import '../../../drawer_options/settings_views/my_account/cards/bank_card.dart';
import '../../../drawer_options/settings_views/settings.dart';
import '../../../drawer_options/settings_views/support/support.dart';
import 'acquire-a_loan_section/get_a_loan.dart';
import 'lender/lender_loans/lender_loan_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedBankAccount;
  final List<String> bankAccount = ["Access Bank 0437193638", "GTBank 0213111726", "FirstBank 3819361374"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List rowButtonItem = DummyData.rowButtonIcon;
  List lender = DummyData.lenderLoans;
  List lender1 = DummyData.lenderLoans1;
  List borrower = DummyData.borrowLoans;
  List borrower1 = DummyData.borrowerLoans1;
  List userData = DummyData.userData;
  List community = DummyData.crendlyCommunity;
  List<PopupMenuItem> loanRequestOptions = DummyData.OpenLoanRequestOption;
  bool isLender = true;

  showMyBankAccountDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2.8, MediaQuery.of(context).size.width /1.2, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            ...List.generate(bankAccount.length, (index){
              return InkWell(
                onTap: (){
                  setState(() {
                    selectedBankAccount = bankAccount[index];
                    Get.back();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 15, left: 24, right: 24),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(bankAccount[index], style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                          selectedBankAccount == bankAccount[index] ? const Icon(Icons.check, size: 12, color: kOrange,): const SizedBox()
                        ],
                      ),
                      const Divider(color: kLighterBackGroundColor,)
                    ],
                  ),
                ),);
            },)
          ],
        ),
      )
    ]);
  }
  bool? isCardSelected = true;

  void showTopUPWalletBottomSheet(){
    Get.bottomSheet(FractionallySizedBox(heightFactor: 0.75,
      child: Container(decoration: BoxDecoration(color: kLightBackGroundColor,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.8,), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: StatefulBuilder(builder: (context, mySetState){
          return Column(
            children: [
              const SizedBox(height: 10,),
              Container(height: 5, width: 50, decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
              const SizedBox(height: 30,),
              Expanded(
                child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("TopUp Wallet", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
                                      IconButton(
                                          onPressed: (){
                                            Get.back();
                                          },
                                          icon: Icon(Icons.clear, color: kOrange, size: 25,)
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Text("How much do you want to fund?",
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                            const SizedBox(height: 13,),
                            FormFieldWidget(
                              filledColor: kLightBackGroundColor,
                              hintText: "Enter amount",
                            ),
                            const SizedBox(height: 24,),
                            DottedLine(
                              dashColor: Color(0xff163393),
                            ),
                            const SizedBox(height: 24,),
                            Text("Fund your wallet using",
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                            const SizedBox(height: 13,),
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(8)),
                              height: 55, width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ButtonWidget(
                                              onPressed: (){
                                                mySetState(() {
                                                  isCardSelected = true;
                                                });
                                              },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                              color: isCardSelected == true ? Colors.black : kWhite
                                          ),
                                              buttonColor: isCardSelected == true ? kOrange : Colors.transparent, buttonText: "Card",
                                              width: MediaQuery.of(context).size.width / 2.5, height: 45
                                          ),
                                          ButtonWidget(
                                              onPressed: (){
                                                mySetState(() {
                                                  isCardSelected = false;
                                                });
                                              },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: isCardSelected == false ? Colors.black : kWhite),
                                              buttonColor: isCardSelected == false ? kOrange : Colors.transparent, buttonText: "Bank Transfer",
                                              width: MediaQuery.of(context).size.width / 2.5, height: 45
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,),
                            isCardSelected == true ? Column(
                              children: [
                                Text("Enter Card Number",
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                                const SizedBox(height: 13,),
                                FormFieldWidget(
                                  filledColor: kLightBackGroundColor,
                                  hintText: "Card number",
                                ),
                                const SizedBox(height: 24,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Expiry date", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                                                const SizedBox(height: 10,),
                                                FormFieldWidget(
                                                  filledColor: kLightBackGroundColor,
                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                  hintText: "MM/YY",
                                                ),
                                              ],
                                            ),
                                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("CVV", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                                                const SizedBox(height: 10,),
                                                FormFieldWidget(
                                                  filledColor: kLightBackGroundColor,
                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                  hintText: "123",
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Text("You will be charged a sum of N200,000.",
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: kWhite),),
                                const SizedBox(height: 50,),
                                ButtonWidget(
                                    onPressed: (){
                                      Get.back();
                                      showPinBottomBottomSheet(context: context,
                                          onPressed: () {
                                            Get.back();
                                            setState(() {
                                              userData.add({
                                                "amount":"N 20,000",
                                                "name":"Obi Victor"
                                              });
                                            });
                                            showTopUpSuccessDialog();
                                          });
                                    }, buttonText: "Pay N200,000",buttonColor: kGreen,
                                    height: 55, width: double.maxFinite
                                ),
                                const SizedBox(height: 50,),
                              ],
                            ) :
                             Column(
                               children: [
                                 DottedBorder(color: Color(0xffC1CDF6), dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
                                   child: Padding(
                                     padding: const EdgeInsets.all(25.0),
                                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Align(alignment: Alignment.center,
                                           child: Text("Make payment using this bank details.",
                                             style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                                         ),
                                         const SizedBox(height: 20,),
                                         const Divider(
                                           color: Color(0xffC1CDF6),
                                         ),
                                         const SizedBox(height: 20,),
                                         Row(mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Expanded(
                                                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                   children: [
                                                     Text("Account Name: ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                     Text("WEMA", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                   ],
                                                 )
                                             )
                                           ],
                                         ),
                                         Row(mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Expanded(
                                                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                   children: [
                                                     Text("Account Number: ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                     Text("588291782882", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                                                     IconButton(onPressed: (){

                                                     }, icon: Icon(Icons.file_copy_outlined, color: kOrange,))
                                                   ],
                                                 )
                                             )
                                           ],
                                         ),
                                       ],
                                     ),
                                   )
                                 ),
                               ],
                             )
                          ],
                        )
                      ]
                  ),
                ),
              ),
            ],
          );
        })
      ),
    ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),),
      isScrollControlled: true, isDismissible: false
    );
  }

  void showRepayLoanBottomSheet(){
    Get.bottomSheet(FractionallySizedBox(heightFactor: 0.4,
      child: Container(decoration: BoxDecoration(color: kLightBackGroundColor,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.8,), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(height: 5, width: 50, decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Repay Loan", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.clear, size: 20, color: kOrange,))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      const SizedBox(height: 36,),
                      Text("Loan Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                      const SizedBox(height: 10,),
                      FormFieldWidget(
                        hintText: "Enter Amount",
                        filledColor: kLightBackGroundColor,
                      ),
                      const SizedBox(height: 34,),
                      ButtonWidget(
                          onPressed: (){
                            Get.back();
                            showRepaymentSuccessDialog();
                          },
                          buttonText: "Make repayment", height: 50,
                          width: double.maxFinite, buttonColor: kGreen,
                      ),
                      const SizedBox(height: 31,),
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    ), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
      ),
      isScrollControlled: true,
    );
  }

  void showFundWithdrawalBottomSheet(){
    Get.bottomSheet(FractionallySizedBox(heightFactor: 0.6,
        child: Container(decoration: BoxDecoration(color: kLightBackGroundColor,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.8,), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(height: 5, width: 50, decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
              const SizedBox(height: 30,),
              Expanded(
                child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Withdraw Funds", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700 ),),

                                IconButton(onPressed: (){
                                  Get.back();
                                }, icon: Icon(Icons.clear, color: kOrange,))
                              ],
                            ),
                            const SizedBox(height: 50,),
                            Text("Amount", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                            const SizedBox(height: 10,),
                            FormFieldWidget(
                              filledColor: kLightBackGroundColor,
                              hintText: "Enter amount",
                            ),
                            SizedBox(height: 30),
                            Text("Select Bank Account", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                            const SizedBox(height: 10,),
                            Container(height: 55, width: double.maxFinite, decoration: BoxDecoration(border: Border.all(color: kWhite, width: 0.7), borderRadius: BorderRadius.circular(8)),
                              child: TextButton(
                                style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                                onPressed: (){
                                 showMyBankAccountDialog();
                                },
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(selectedBankAccount ?? "Bank Account", style: TextStyle(color: selectedBankAccount == null ? const Color(0xff868484) : kWhite, fontSize: 18),),
                                    const Icon(Icons.keyboard_arrow_down, color: kWhite)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 35,),
                            ButtonWidget(
                                onPressed: (){
                                  Get.back();
                                  showPinBottomBottomSheet(context: context,
                                      onPressed: () {
                                        Get.back();
                                        showSuccessfulWithdrawalDialog();
                                      });
                                  },
                                buttonText: "Withdraw Funds",
                                height: 55, buttonColor: kGreen,
                                width: double.maxFinite
                            ),
                          ],
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
      ),
      isScrollControlled: true,
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => showMyDialog(),);
    super.initState();
  }
  showTransactionPinSetDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 70, width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.lock, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 65, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Text("Transaction PIN Set", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 5,),
            Text("Transaction PIN set successfully", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
            const SizedBox(height: 20,),
            Container(height: 65, width:2, color: kGreen,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:60.0),
              child: CustomOutlineButton(
                  backGroundColor: const Color(0xff081952),
                  text: "Ok", height: 50,
                  onPressed: (){
                    Get.back();
                  }
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  showRepaymentSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 3,),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(AssetPath.sendIcon)
              ),
              const SizedBox(height: 13,),
              Text("Loan repayment successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
              const SizedBox(height: 19,),
              Text("You successfully repaid your loan", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
              const SizedBox(height: 90,),
              ButtonWidget(
                onPressed: (){
                  Get.back();
                },
                buttonText: "Go to Home",
                height: 50, buttonColor: kGreen,
                width: double.maxFinite,
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      )
    ]);
  }

  showTopUpSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.add, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 40,),
            Text("TopUp successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Your wallet topup was successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
            const SizedBox(height: 40,),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.back();
                },
                buttonText: "Go to Home",
                height: 50, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  showSuccessfulWithdrawalDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 70, width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.print_outlined, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 65, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Text("Withdrawal successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 5,),
            Text("Your withdrawal was successful", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
            const SizedBox(height: 20,),
            Container(height: 65, width:2, color: kGreen,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                  onPressed: (){
                   setState(() {
                     Get.back();
                     userData.add({
                       "amount":"N 20,000",
                       "name":"Obi Victor"
                     });
                   });
                  },
                  buttonText: "Go to Home",
                  height: 50, buttonColor: kGreen,
                  width: double.maxFinite,
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }


  showMyDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Text("Create Transaction PIN", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            Text("Create your very own transaction PIN ", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400)),
            const Spacer(flex: 2,),
            Text("Enter New PIN", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
            const SizedBox(height: 20,),
            PinCodeWidget(
              onChanged: (value) {},
              length: 4, padding: 45,
            ),
            const SizedBox(height: 20,),
            Text("Confirm New PIN", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
            const SizedBox(height: 10,),
            PinCodeWidget(
              onChanged: (value) {},
              length: 4, padding: 45,
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:60.0),
              child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                    showTransactionPinSetDialog();
                  }, buttonText: "Set PIN", buttonColor: kGreen,
                  height: 50, width: double.maxFinite
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  void showCreatePortfolioBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/2,
        children: [
          Align(alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.clear, color: kOrange,),),
          ),
          const SizedBox(height: 27,),
          Align(alignment: Alignment.center,
              child: CircleAvatar(backgroundColor: kBlue, radius: 48, child: SvgPicture.asset(AssetPath.createPortFolio))),
          const SizedBox(height: 18,),
          Align(alignment: Alignment.center,
            child: Text("Create a portfolio", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          const SizedBox(height: 5,),
          Align(alignment: Alignment.center,
            child: Text("You are about to create your \nfirst portfolio.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 14)),
          ),
          const SizedBox(height: 64,),
          ButtonWidget(onPressed: (){
            Get.back();
            Get.to(()=>CreateALoanPortfolio());
          }, buttonText: "Let’s start",
            height: 50, width: double.maxFinite, buttonColor: kGreen,)
        ]
    );
  }

  void showEmptyWithdrawalWalletBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/2,
        children: [
          Align(alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.clear, color: kOrange,),),
          ),
          Align(alignment: Alignment.center,
              child: CircleAvatar(backgroundColor: kBlue, radius: 35, child: Icon(Icons.print_outlined, color: kWhite, size: 40,))),
          const SizedBox(height: 30,),
          Align(alignment: Alignment.center,
            child: Text("You have no funds to \nwithdraw yet.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          const SizedBox(height: 30,),
          Align(alignment: Alignment.center,
            child: Text("Fusce lacinia vulputate gravida massa \nnibh faucibus lorem vel etiam. ", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
          ),
        ]
    );
  }

  void showTotalBalanceBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/5,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Balance", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontWeight: FontWeight.w700, fontSize: 20),),
              Align(alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.clear, color: kOrange,),),
              ),
            ],
          ),
          Text("This is your balance which shows a combination of your accessible balance and the balance set aside to finance your portfolio.",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),)
        ]
    );
  }

  void showAccessibleBalanceBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/5,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Accessible balance", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontWeight: FontWeight.w700, fontSize: 20),),
              Align(alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.clear, color: kOrange,),),
              ),
            ],
          ),
          Text("This is your balance which you can actively carry out activities such as withdrawals, repayments, etc.",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),)
        ]
    );
  }

  selectBetweenTopWithDrawAndMoreOption(int index){
    if(index == 0 && userData.isEmpty){
      showTopUPWalletBottomSheet();
    }else if(index == 0 && userData.isNotEmpty){
      showTopUPWalletBottomSheet();
    }else if(index == 1 && userData.isEmpty){
      // showFundWithdrawalBottomSheet();
      showEmptyWithdrawalWalletBottomSheet(context);
    }else if(index == 1 && userData.isNotEmpty){
      showFundWithdrawalBottomSheet();
    }else if(index == 2 && userData.isEmpty){
      _scaffoldKey.currentState?.openEndDrawer();
    }else if(index == 2 && userData.isNotEmpty){
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  drawerContent(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0,28.0,25.0,0.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Others", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
                Get.back();
              },
                  icon: Icon(Icons.clear, color: kOrange, size: 20,)
              )
            ],
          ),
          const SizedBox(height: 5,),
          DottedBorder(color: Color(0xff2E4DBD),
              dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            Text("Your profile is 80% complete", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                            const SizedBox(height: 10,),
                            LinearProgressIndicator(
                              value: 0.8, backgroundColor: Color(0xff040F35), color: kGreen,
                              minHeight: 5,
                            ),
                            TextButton(
                                onPressed: (){},
                                child: Text("Complete your profile",
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, decoration: TextDecoration.underline, fontSize: 14),)
                            )
                          ],
                        ),
                      )
                  )
                ],
              )
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Text("Quick menu", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
              const SizedBox(width: 5,),
              Expanded(child: Divider(color: Colors.blue, height: 4,),),
            ],
          ),
         Expanded(
           child: SingleChildScrollView(
             controller: scrollController,
             physics: const BouncingScrollPhysics(),
             child: Column(
               children: [
                 GridView.count(
                   controller: scrollController,
                   crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: (0.7/0.8),
                   shrinkWrap: true, crossAxisCount: 3,
                   children: List.generate(quickMenu.length, (index){
                     return GestureDetector(
                       onTap: (){
                         String title = quickMenu[index]["title"];
                         if (title.toLowerCase() == "settings") {
                           Get.to(()=> Settings());
                         }else if(title.toLowerCase() == "support"){
                           Get.to(()=> const Support());
                         }else if(title.toLowerCase() == "cards"){
                           Get.to(()=> const BankCard());
                         }else if(title.toLowerCase() == "bank"){
                           Get.to(()=> const BankAccount());
                         }else if(title.toLowerCase() == "invite"){
                           Get.to(()=> const InviteScreen());
                         }else if(title.toLowerCase() == "statements"){
                           Get.to(()=> const StatementScreen());
                         }else if (title.toLowerCase() == "calculator"){
                           Get.to(()=> const LoanCalculator());
                         }
                       },
                       child: Container(
                         decoration: BoxDecoration(color: const Color(0xFF4700E0), borderRadius: BorderRadius.circular(8)),
                         child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             CircleAvatar(backgroundColor: Color(0xff6219FF), radius: 16, child: Icon(quickMenu[index]["image"], size: 20, color: kWhite,)),
                             Text(quickMenu[index]["title"],
                               style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14,color: kWhite, fontWeight: FontWeight.w700,),),
                           ],
                         ),
                       ),
                     );
                   }),
                 ),
                 const SizedBox(height: 20,),
               ],
             ),
           ),
         )
        ],
      ),
    );
  }

  final List quickMenu = DummyData.quickMenu;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
          endDrawer: Container(width: MediaQuery.of(context).size.width / 1.1, height: MediaQuery.of(context).size.height,
            child: Drawer(backgroundColor: kLightBackGroundColor, child: drawerContent(),),),
          key: _scaffoldKey,
          endDrawerEnableOpenDragGesture: true,
          body: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(padding: const EdgeInsets.only(left: 25, right: 25, top: 42), width: double.maxFinite, height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(color: kLightBackGroundColor, border: Border.all(color: kLightBackGroundColor),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
                      ),
                      Container(padding: const EdgeInsets.only(left: 25, right: 25, top: 42), width: double.maxFinite, height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                    ],
                  ),
                  Container(
                    width: double.maxFinite, height: MediaQuery.of(context).size.height / 3,
                    color: Colors.transparent,
                    child:  Stack(
                       children: [
                         Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.fromLTRB(24.0, 40, 24,0),
                               child: SizedBox(height: 50, width: double.maxFinite,
                                 child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Container(height: 40, width: 40, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                       child: Center(child: SvgPicture.asset(AssetPath.orangeHead, theme: const SvgTheme(fontSize: 25),),),),
                                     const SizedBox(width: 9,),
                                     Text("Hi, Damilare", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15, fontWeight: FontWeight.w700, color: kOrange),),
                                     const Spacer(),
                                     userData.isEmpty ? const SizedBox() : IconButton(onPressed: (){}, icon: SvgPicture.asset(AssetPath.search, theme: const SvgTheme(fontSize: 25),),),
                                     IconButton(onPressed: (){
                                       Get.to(()=> const NotificationPage());
                                     }, icon: const Icon(Icons.notifications_none, color: kWhite,)),
                                   ],
                                 ),
                               ),
                             ),
                             const SizedBox(height: 56,),
                             Expanded(
                               child: SingleChildScrollView(
                                 physics: const BouncingScrollPhysics(),
                                 scrollDirection: Axis.horizontal,
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 16.0),
                                   child: Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(right: 8.0),
                                         child: Container(padding: const EdgeInsets.all(16),
                                           height: 114, width: MediaQuery.of(context).size.width / 1.2,
                                           decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4)),
                                             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                       Text("Accessible Balance", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                                       GestureDetector(
                                                         onTap: (){
                                                           showAccessibleBalanceBottomSheet(context);
                                                         },
                                                           child: Icon(Icons.error_outline, color: kWhite)),
                                                     ],
                                                   ),
                                                   Text( userData.isEmpty ? "₦0" : "₦350,000,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 30, fontWeight: FontWeight.w700),),
                                                 ],
                                             )
                                         ),
                                       ),
                                       Container(
                                         padding: const EdgeInsets.all(16),
                                         height: 114, width: MediaQuery.of(context).size.width / 1.2,
                                         decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4)),
                                           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Text("Total Balance", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                                   GestureDetector(
                                                       onTap: (){
                                                         showTotalBalanceBottomSheet(context);
                                                       },
                                                       child: Icon(Icons.error_outline, color: kWhite)),
                                                 ],
                                               ),
                                               Text( userData.isEmpty ? "₦0" : "₦350,000,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 30, fontWeight: FontWeight.w700),),
                                             ],
                                           )
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(height: 20,),
                           ],
                         ),
                       ],
                     ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(rowButtonItem.length, (index){
                      return InkWell(
                        onTap: (){
                          selectBetweenTopWithDrawAndMoreOption(index);
                        },
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(backgroundColor: kBlue, radius: 24, child: rowButtonItem[index]["icon"]),
                            const SizedBox(height: 8,),
                            Text(rowButtonItem[index]["Text"], textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: kWhite),)
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       userData.isEmpty ?  const SizedBox() :
                        Container(
                            padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xff122C85), borderRadius: BorderRadius.circular(8)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Payday Loan", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                                        Text("2%p.a", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kGreen, fontSize: 24, fontWeight: FontWeight.w700),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                                          decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: Color(0xffC1CDF6))),
                                          child: Text("Open Loan request", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xffC1CDF6), fontSize: 10),),
                                        ),
                                        const SizedBox(width: 15,),
                                        PopupMenuButton(
                                            color: kLightBackGroundColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                            child: Icon(Icons.more_vert_rounded, color: kWhite,),
                                            itemBuilder: (BuildContext context)=>loanRequestOptions),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15,),
                                const Divider(color: kBrighterBackGroundColor,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Amount", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                                        const SizedBox(height: 5,),
                                        Text("₦50,000", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                                        const SizedBox(height: 19,),
                                        Text("Payment", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                                        const SizedBox(height: 5,),
                                        Text("Installment", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                                      ],
                                    ),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Duration", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                                        const SizedBox(height: 5,),
                                        Text("6 Months", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                                        const SizedBox(height: 19,),
                                        Text("Lender’s rep", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),),
                                        const SizedBox(height: 5,),
                                        Text("89.2%", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: userData.isEmpty ? 0: 32),
                        Container(
                          padding: const EdgeInsets.only(top: 23, left: 16, right: 16, bottom: 23,), width: double.maxFinite, height:  userData.isEmpty ?MediaQuery.of(context).size.height / 4 : MediaQuery.of(context).size.height / 3.2,
                          decoration: BoxDecoration(gradient: const LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: greenGradient),
                              border: Border.all(), borderRadius: BorderRadius.circular(12)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userData.isEmpty ?  const SizedBox() :
                              Expanded(
                                child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 40, height: 40,
                                          child: Stack(alignment: AlignmentDirectional.topCenter,
                                            children: [
                                              CircularProgressIndicator(value: 0.25, backgroundColor: Color(0xffADD4BE), color: Color(0xffFF0062), strokeWidth: 3,),
                                              Positioned(top: 7, left: 5, right: 5, bottom: 7, child: Center(child: Text('25%',
                                                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14,fontWeight: FontWeight.w700, color: const Color(0xff070647)),)),)
                                            ],
                                          ),
                                        ),
                                        Text('Credit \nScore', style: Theme.of(context).textTheme.bodyText2?.copyWith(color:const Color(0xff070647), fontSize: 10,fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Expanded(
                                        child:  Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('25', style: Theme.of(context).textTheme.bodyText2?.copyWith(  fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff070647))),
                                                const SizedBox(width: 6,),
                                                Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xffFED0B7),)),
                                                const SizedBox(width: 6),
                                                Text('Taken', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                    ),
                                    const Spacer(),
                                  Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('24', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff070647)),),
                                              const SizedBox(width: 6,),
                                              Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xff4700E0),)),
                                              const SizedBox(width: 6),
                                              Text('Repaid', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                  ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              userData.isEmpty ?
                              Align(alignment: Alignment.center,
                                child: Text("You have no loans yet. \nTake a loan to see your \nloan data.", textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: const Color(0xff131176), fontWeight: FontWeight.bold, fontSize: 20),),
                              ) :
                              IntrinsicHeight(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Current Loan', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('-₦50,000.00', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xff070647)))
                                      ],
                                    ),
                                    const SizedBox(height: 46, child: VerticalDivider(color: Colors.red),),
                                    Column(
                                      children: [
                                        Text('Loan Limit', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('₦1,050,000.00',
                                            style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xff070647))
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              userData.isEmpty ? InkWell(
                                onTap: (){
                                  Get.to(()=> const GetALoan());
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18), decoration: BoxDecoration(color: Colors.white,
                                    border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(4)),
                                  width: double.maxFinite, height: 50,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AssetPath.takenLoanIcon),
                                      const SizedBox(width: 5,),
                                      const Text('Take Loan')
                                    ],
                                  ),
                                ),
                              ) :
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: InkWell(onTap: (){
                                        Get.to(()=> const GetALoan());
                                      },
                                        child: Card(elevation: 3,
                                          child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(color: kWhite, border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(4)),
                                              height: 48,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(AssetPath.takenLoanIcon),
                                                  const SizedBox(width: 5,),
                                                  Text('Take Loan', overflow: TextOverflow.ellipsis,style:
                                                  Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: kTextBlue))
                                                ],
                                              )
                                          ),
                                        ),
                                      ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: InkWell(onTap: (){
                                      showRepayLoanBottomSheet();
                                    },
                                      child: Card(elevation: 3,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(color: Colors.white,
                                            border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(4)), height: 48,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(AssetPath.repaidLoanIcon),
                                              const SizedBox(width: 5,),
                                              Text('Repay Loan', overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12, color: kTextBlue, fontWeight: FontWeight.w600),)
                                            ],
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(width: 37, height: 48,
                                    decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.more_vert, color: kWhite,),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.only(top: 23, left: 16, right: 16, bottom: 23),
                          width: double.maxFinite, height: userData.isEmpty ? MediaQuery.of(context).size.height/4 :MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(gradient: const LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: orangeGradient),
                              border: Border.all(), borderRadius: BorderRadius.circular(12)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userData.isEmpty ? const SizedBox() :
                              Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 40, height: 40,
                                        child: Stack(alignment: AlignmentDirectional.topCenter,
                                          children: [
                                            CircularProgressIndicator(value: 0.69, backgroundColor: Color(0xffD3A48B), color: Color(0xffADD4BE), strokeWidth: 3,),
                                            Positioned(top: 7, left: 5, right: 5, bottom: 7, child: Center(child: Text('69%',
                                              style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14,fontWeight: FontWeight.w700, color: const Color(0xff070647)),)),)
                                          ],
                                        ),
                                      ),
                                      Text('Reputation', style: Theme.of(context).textTheme.bodyText2?.copyWith(color:const Color(0xff070647), fontSize: 10,fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('65', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xff070647))),
                                          const SizedBox(width: 6,),
                                          Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647),))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xffFF0062),)),
                                          const SizedBox(width: 6),
                                          Text('Disbursed', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('24', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xff070647))),
                                          const SizedBox(width: 6,),
                                          Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xff4700E0),)),
                                          const SizedBox(width: 6),
                                          Text('Collected', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              userData.isEmpty ? Align(alignment: Alignment.center,
                                child: Text("You have no portfolio yet. \nCreate a portfolio to see \nyour portfolio data.",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: const Color(0xff131176), fontWeight: FontWeight.bold, fontSize: 20)),
                              ) :
                              IntrinsicHeight(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Running Portfolio', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('₦500,000.00', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black)
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 46, child: VerticalDivider(color: Colors.red,),),
                                    Column(
                                      children: [
                                        Text('Total Loan Disbursed', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('₦3,050,000.00', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                             
                              userData.isEmpty ? GestureDetector(
                                  onTap: (){
                                    showCreatePortfolioBottomSheet(context);
                                  },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18), decoration: BoxDecoration(color: Colors.white,
                                    border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(4)),
                                  width: double.maxFinite, height: 55,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AssetPath.addFile),
                                      const SizedBox(width: 5,),
                                      const Text('Create Portfolio')
                                    ],
                                  ),
                                ),
                              ) :
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        showCreatePortfolioBottomSheet(context);
                                      },
                                      child: Card(elevation: 3,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(4)), height: 48,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(AssetPath.addFile),
                                              const SizedBox(width: 5,),
                                              Text('Create Portfolio', overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12, color: kTextBlue, fontWeight: FontWeight.w600),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                      child: Card(elevation: 3,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(4)),
                                          height: 48,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(AssetPath.funds),
                                              const SizedBox(width: 5,),
                                              Text('Fund Portfolio', overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: kTextBlue),)
                                            ],
                                          ),
                                        ),
                                      ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: 37, height: 48,
                                    decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.more_vert, color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32,),
                        Container(
                          decoration: BoxDecoration(color: kLightBackGroundColor,
                              border: Border.all(color: kLightBackGroundColor), borderRadius: BorderRadius.circular(30)),
                          height: 40, width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonWidget(
                                          onPressed: (){
                                            setState((){
                                              isLender = true;
                                            });
                                          },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                          color: isLender == true ? Colors.black : kWhite
                                      ),
                                          buttonColor: isLender == true ? kPaleBlue : Colors.transparent, buttonText: "Lender",
                                          width: MediaQuery.of(context).size.width / 2.3, height: 45, borderRadius: 20,
                                      ),
                                      ButtonWidget(
                                          onPressed: (){
                                            setState(() {
                                              isLender = false;
                                            });
                                          },buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: isLender == false ? Colors.black : kWhite),
                                          buttonColor: isLender == false ? kPaleBlue : Colors.transparent, buttonText: "Borrower",
                                          width: MediaQuery.of(context).size.width / 2.3, height: 45, borderRadius: 20,
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Text("Browse Loans as a Lender", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),
                        Text("As a Lender, easily see borrowers loan request and give out loans.",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                        const SizedBox(height: 16,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
                          child: isLender == true ? Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(lender.length, (index){
                                return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ShaderMask(
                                      shaderCallback: (rect) => LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                          colors:[Colors.black87,Colors.black38.withOpacity(0.3)]
                                      ).createShader(rect),
                                      blendMode: BlendMode.darken,
                                      child: Container(height: MediaQuery.of(context).size.height / 4,width: MediaQuery.of(context).size.width / 2,
                                        padding: const EdgeInsets.all(13.0),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: AssetImage(lender[index]["asset"]))),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 40,),
                                                  ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3, minHeight: 50),
                                                      child: Text(lender[index]["title"],
                                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w700,),)),
                                                  const SizedBox(height:15,),
                                                  ButtonWidget(
                                                    onPressed: (){
                                                      Get.to(()=> LoanOptions(data: lender[index],));
                                                    }, borderRadius: 8,
                                                    buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                                    height: 37, width: 87, buttonColor: kWhite,
                                                  ),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                );
                              })
                            ],
                          ) : Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(borrower.length, (index){
                                return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ShaderMask(
                                      shaderCallback: (rect) => LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                          colors:[Colors.black87,Colors.black38.withOpacity(0.3)]
                                      ).createShader(rect),
                                      blendMode: BlendMode.darken,
                                      child: Container(height: MediaQuery.of(context).size.height / 4,width: MediaQuery.of(context).size.width / 2,
                                        padding: const EdgeInsets.all(13.0),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: AssetImage(borrower[index]["asset"]))),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 40,),
                                                  ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3, minHeight: 50),
                                                      child: Text(borrower[index]["title"],
                                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w700,),)),
                                                  const SizedBox(height:15,),
                                                  ButtonWidget(
                                                    onPressed: (){
                                                      Get.to(()=> LoanOptions(data: borrower[index],));
                                                    }, borderRadius: 8,
                                                    buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                                    height: 37, width: 87, buttonColor: kWhite,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                );
                              })
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
                          child: isLender == true ? Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(lender1.length, (index){
                                return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ShaderMask(
                                      shaderCallback: (rect) => LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                          colors:[Colors.black87,Colors.black38.withOpacity(0.3)]
                                      ).createShader(rect),
                                      blendMode: BlendMode.darken,
                                      child: Container(height: MediaQuery.of(context).size.height / 4,width: MediaQuery.of(context).size.width / 2,
                                        padding: const EdgeInsets.all(13.0),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: AssetImage(lender1[index]["asset"]))),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 40,),
                                                  ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3, minHeight: 50),
                                                      child: Text(lender1[index]["title"],
                                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w700,),)),
                                                  ButtonWidget(
                                                    onPressed: (){
                                                      Get.to(()=> LoanOptions(data: lender1[index],));
                                                    }, borderRadius: 8,
                                                    buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                                    height: 37, width: 87, buttonColor: kWhite,
                                                  ),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                );
                              })
                            ],
                          ) : Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(borrower1.length, (index){
                                return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ShaderMask(
                                      shaderCallback: (rect) => LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                          colors:[Colors.black87,Colors.black38.withOpacity(0.3)]
                                      ).createShader(rect),
                                      blendMode: BlendMode.darken,
                                      child: Container(height: MediaQuery.of(context).size.height / 4,width: MediaQuery.of(context).size.width / 2,
                                        padding: const EdgeInsets.all(13.0),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: AssetImage(borrower1[index]["asset"]))),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 40,),
                                                  ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3, minHeight: 50),
                                                      child: Text(borrower1[index]["title"],
                                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w700,),)),
                                                  ButtonWidget(
                                                    onPressed: (){
                                                      Get.to(()=> LoanOptions(data: borrower1[index],));
                                                    }, borderRadius: 8,
                                                    buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                                    height: 37, width: 87, buttonColor: kWhite,
                                                  ),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                );
                              })
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        isLender == true ? Container(height: MediaQuery.of(context).size.height / 2, width: double.maxFinite,
                          padding: const EdgeInsets.fromLTRB(34.0, 40.0, 30.0, 27.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: AssetImage(AssetPath.others))),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Others", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              ButtonWidget(
                                onPressed: (){},
                                borderRadius: 8,
                                buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                height: 37, width: 87, buttonColor: kWhite,
                              ),
                            ],
                          ),
                        ) : Container(height: MediaQuery.of(context).size.height / 2, width: double.maxFinite,
                          padding: const EdgeInsets.fromLTRB(34.0, 40.0, 30.0, 27.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: AssetImage(AssetPath.others1))),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Others", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              ButtonWidget(
                                onPressed: (){},
                                borderRadius: 8,
                                buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                height: 37, width: 87, buttonColor: kWhite,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24,),
                        Container(width: double.maxFinite, height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 0.0),
                          decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8.0)),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3, minHeight: 50),
                                              child: Text("Advert board", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),)),
                                          const Spacer(),
                                          ButtonWidget(
                                            onPressed: (){}, buttonTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16, color: Color(0xff00071F), fontWeight: FontWeight.bold),
                                            buttonText: "Sign Up",
                                            height: 38, buttonColor: kGreen,
                                            width: 126, borderRadius: 8,
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.asset(AssetPath.tag),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text("Inside Crendly’s Community", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),

                        ...List.generate(community.length, (index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Container(height: MediaQuery.of(context).size.height / 2, width: double.maxFinite,
                              padding: const EdgeInsets.fromLTRB(34.0, 40.0, 30.0, 27.0), decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: AssetImage(community[index]["asset"]))),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2.5, minHeight: 50),
                                              child: Text(community[index]["title"],
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 22,color: kWhite, fontWeight: FontWeight.w700),)),
                                          const SizedBox(height: 33,),
                                          ButtonWidget(
                                              onPressed: (){},borderRadius: 8, buttonColor: kWhite,
                                              buttonText: community[index]["buttonLabel"],
                                              height: 48, width: MediaQuery.of(context).size.width / 2.3
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  // Widget getViewTabBar(int index) {
  //   switch (index) {
  //     case 0:
  //       return const BankCard();
  //     case 1:
  //       return const BankTransfer();
  //     default:
  //       return const BankCard();
  //   }
  // }
}
