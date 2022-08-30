import 'dart:async';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/loan_negotiation_request/widgets/loan_term_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/loan_negotiation_request/widgets/negotiation_term_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../../../../../bottom_nav_bar/bottom_nav_bar_screen.dart';


class LoanNegotiationRequest extends StatefulWidget {
  const LoanNegotiationRequest({Key? key}) : super(key: key);

  @override
  State<LoanNegotiationRequest> createState() => _LoanNegotiationRequestState();
}

class _LoanNegotiationRequestState extends State<LoanNegotiationRequest> {

  bool? isInstallment;
  bool? isOneOff;

  void showRenegotiationDialog(){
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
                                        Text(isOneOff == true ? "Negotiate with this Lender" : "Renegotiate with this \nBorrower", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
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
                              const SizedBox(height: 26,),
                              Text("How much interest is fine by you?",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                              const SizedBox(height: 8,),
                              FormFieldWidget(
                                filledColor: kLightBackGroundColor,
                                hintText: "Enter interest rate",
                              ),
                              const SizedBox(height: 17,),
                              Text("How long do you want to negotiate?",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                              const SizedBox(height: 8,),
                              FormFieldWidget(
                                filledColor: kLightBackGroundColor,
                                hintText: "Enter interest rate",
                              ),
                              const SizedBox(height: 17,),
                              Text("What payment method are you going for?",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                              const SizedBox(height: 18,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                       mySetState((){
                                         isInstallment = true;
                                         isOneOff = false;
                                       });
                                    },
                                    child: Container(
                                      height: 44, width: MediaQuery.of(context).size.width / 2.5,
                                      decoration: BoxDecoration(color: isInstallment == true ? kLighterBackGroundColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20), border: Border.all(color: kPaleBlue)
                                      ),
                                      child: Center(child: Text("Installment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                        mySetState((){
                                          isOneOff = true;
                                          isInstallment = false;
                                        });
                                    },
                                    child: Container(
                                      height: 44, width: MediaQuery.of(context).size.width / 2.5,
                                      decoration: BoxDecoration(color: isOneOff == true ? kLighterBackGroundColor : Colors.transparent,
                                          borderRadius: BorderRadius.circular(20), border: Border.all(color: kPaleBlue)
                                      ),
                                      child: Center(child: Text("One-Off", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),)),
                                    ),
                                  ),
                                ],
                              ),
                              isInstallment == true && isOneOff == false ?
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 18,),
                                      GroupButton(
                                        options: GroupButtonOptions(
                                            spacing: 10,
                                            selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                                            unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                                            unselectedColor: Colors.transparent, mainGroupAlignment: MainGroupAlignment.start,
                                            unselectedBorderColor: kWhite, crossGroupAlignment: CrossGroupAlignment.start,
                                            borderRadius: BorderRadius.circular(25), buttonHeight: 44,
                                            buttonWidth: MediaQuery.of(context).size.width / 3.8),
                                        isRadio: false,
                                        onSelected: (String value, index, isSelected) {},
                                        buttons: ["Daily", "Weekly", "Monthly",],
                                      ),
                                      const SizedBox(height: 70,),
                                    ],
                                  ) : isOneOff == true && isInstallment == false ?
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 22,),
                                      Text("Date you are to make payment.", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                                      const SizedBox(height: 8,),
                                      const FormFieldWidget(
                                        filledColor: kLightBackGroundColor,
                                        hintText: "23/4/2022",
                                        suffixIcon: Icon(Icons.calendar_today_outlined, color: kWhite, size: 25,),
                                      ),
                                      const SizedBox(height: 57,),
                                    ],
                                  ):
                              const SizedBox(height: 166,),
                              ButtonWidget(
                                  onPressed: (){
                                showSentRenegotiationTermDialog();
                                Timer(const Duration(seconds: 3), ()=> Get.offAll(()=> const BottomNavigationBarScreen()));
                                }, buttonColor: isInstallment == null && isOneOff == null ? Color(0xff3A3A3A) : kGreen,
                                  buttonText: "Submit Renegotiation terms",
                                  height: 50, width: double.maxFinite
                              ),
                              const SizedBox(height: 48,),
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
    ), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),),
        isScrollControlled: true, isDismissible: false,
    );
  }

  showAcceptNegotiationDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Align(alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 13,),
              Align( alignment: Alignment.center,
                  child: Text("Negotiation request \naccepted", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("You have accepted this negotiation request. A notification of your acceptance will be sent to the Borrower.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              const Spacer(flex: 4,),
            ],
          ),
        ),
      )
    ]);
  }

  showRejectionDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Align(alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 13,),
              Align( alignment: Alignment.center,
                  child: Text("Negotiation request \nrejected", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("You have accepted this negotiation request. A notification of your acceptance will be sent to the Borrower.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              const Spacer(flex: 4,),
            ],
          ),
        ),
      )
    ]);
  }

  showSentRenegotiationTermDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Align(alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(height: 65, width: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                  child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 13,),
              Align( alignment: Alignment.center,
                  child: Text("Renegotiation terms \nsent to Borrower", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("Your negotiation terms have been sent \nto the Lender. You will get a \nnotification when the borrower \naccepts or declines.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              const Spacer(flex: 4,),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            centerTitle: false,
            appBarLabel: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Loan negotiation request", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
                const SizedBox(height: 7,),
                Text("Loan negotiation request from borrower.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
              ],
            ),
            onBackPressed: (){
              Get.back();
            },
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  Text("Loan Terms", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10,),
                  LoanTermWidget(
                    loanType: "Payday",
                    loanAmount: "₦125,000",
                    interestRate: "3%",
                    repayment: "One Off",
                    loanTenor: "180 days",
                    totalRepaymentAmount: "₦130,000",
                  ),
                  const SizedBox(height: 24,),
                  Text("Negotiation Terms", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10,),
                  NegotiationTermWidget(
                    interestRate: "2%",
                    interestType: "Installment",
                    loanTenor: "360 days",
                    repaymentFrequency: "Monthly",
                  ),
                  const SizedBox(height: 58,),
                  ButtonWidget(
                      onPressed: (){
                        showAcceptNegotiationDialog();
                        Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
                      }, buttonColor: kGreen,
                      buttonText: "Accept Negotiation",
                      height: 50, width: double.maxFinite
                  ),
                  const SizedBox(height: 13,),
                  CustomOutlineButton(text: "Renegotiation",
                      onPressed: (){
                        showRenegotiationDialog();
                  }, height: 50,
                  ),
                  const SizedBox(height: 39,),
                  Align(alignment: Alignment.center,
                    child: TextButton(onPressed: (){
                      showRejectionDialog();
                      Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
                    },
                        child: Text("Reject Negotiation",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, color: kRedPink, ),)
                    ),
                  ),
                  const SizedBox(height: 110,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
