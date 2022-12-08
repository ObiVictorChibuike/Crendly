import 'dart:async';
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/compare_loans.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/loan_board.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/widget/compare_loan_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/widget/loan_detail_tile_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:image_stack/image_stack.dart';
import '../../../../../bottom_nav_bar/bottom_nav_bar_screen.dart';


class LoanCondition extends StatefulWidget {
  final data;
  const LoanCondition({Key? key, this.data}) : super(key: key);

  @override
  State<LoanCondition> createState() => _LoanConditionState();
}

class _LoanConditionState extends State<LoanCondition> {

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
                              FormFieldWidget(
                               labelTitle: "How much interest is fine by you?",
                                filledColor: kLightBackGroundColor,
                                hintText: "Enter interest rate",
                              ),
                              const SizedBox(height: 17,),
                              FormFieldWidget(
                                labelTitle: "How long do you want to negotiate?",
                                filledColor: kLightBackGroundColor,
                                hintText: "Enter interest rate",
                              ),
                              const SizedBox(height: 32,),
                              Text("What payment method are you going for?",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w500, fontSize: 16),),
                              const SizedBox(height: 8,),
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
                                  const FormFieldWidget(
                                    labelTitle: "Date you are to make payment.",
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
                                    Get.back();
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

  showNotedRequestDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.6, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, size: 20, color: kOrange,)),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(height: 70, width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: Center(child: SvgPicture.asset(AssetPath.pickFile)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Text("Your loan request has \nbeen noted.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 76,),
            Text("Submit two (2) more loan interests to \nincrease your chances.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),),
            const SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                    Get.to(()=> const LoanBoard());
                  }, buttonText: "Continue", buttonColor: kGreen,
                  height: 50, width: double.maxFinite),
            ),
            const Spacer(flex: 9,),
          ],
        ),
      )
    ]);
  }

  void showCompareBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.8,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select a Loan to compare", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
              GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.clear, color: kOrange,))
            ],
          ),
          const SizedBox(height: 59,),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(9, (index){
                  return CompareLoanWidget(
                    title: "Payday Loan",
                    repaymentPercentage: "2%p.a",
                    amount: "N50,000",
                    duration: "6 Months",
                    payment: "Installment",
                    lenderRep: "44.2%",
                  );
                })
              ],
            ),
          ),
          const SizedBox(height: 64,),
          ButtonWidget(
            onPressed: (){
              Get.back();
              Get.to(()=> const CompareLoanScreen());
            },
            buttonText: "Compare Loan", height: 50,
              width: double.maxFinite, buttonColor: kGreen,
          ),
          const SizedBox(height: 50,),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(centerTitle: false, bottomPadding: 0,
          actionWidget: Row(
            children: [
              SvgPicture.asset(AssetPath.compareOffer),
              TextButton(
                  onPressed: (){
                    showCompareBottomSheet(context);
                  },
                  child: Text("Compare offer",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontWeight: FontWeight.w700, fontSize: 14, decoration: TextDecoration.underline),)
              )
            ],
          ),
          appBarLabel: Text("Offers Details", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24,),
                        LoanDetailTileWidget(
                          title: "Payday Loan",
                          percentage: "89.3%",
                          amount: "N50,000",
                          paymentType: "Installment",
                          duration: "6 Months",
                          interestOnLoan: "2% (Monthly)",
                          repayableAmount: "₦65,000",
                          monthlyInterest: "0.4%",
                        ),
                        const SizedBox(height: 16,),
                        Text("Portfolio Owner", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 6,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: DottedBorder(
                            color: kBrighterBackGroundColor, dashPattern: [3.3],
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16, backgroundColor: kWhite,
                                    child: SvgPicture.asset(AssetPath.orangeHead),
                                  ),
                                  const SizedBox(width: 5,),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Reputation score", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                      Text("89.3% ", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700),),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(height: 40,width: 1, color: kBrighterBackGroundColor,),
                                  const Spacer(),
                                  Text("Loans disbursed", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                ],
                              ),
                            )
                          ),
                        ),
                        const SizedBox(height: 22,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Viewed by", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ImageStack(
                                  imageSource: ImageSource.Asset, imageRadius: 20,
                                  showTotalCount: false, backgroundColor: kWhite,
                                  imageList: DummyData.stackImages, imageBorderColor: kWhite,
                                  totalCount:DummyData.stackImages.length,
                                  imageCount: 3, imageBorderWidth: 2,
                                ),
                                const SizedBox(width: 10,),
                                Text("49 people ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 46,),
                        Text("About this Loans", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
                        const SizedBox(height: 6,),
                        Text("Quis viverra convallis posuere facilisi. Enim id dictum "
                            "aenean neque luctus justo, est porttitor pharetra. Maecenas"
                            " platea facilisis nibh facilisis vel ipsum dolor. Lacus, et "
                            "suspendisse mauris convallis amet, tincidunt turpis habitant. "
                            "Dictum laoreet nec amet id scelerisque. Viverra ultricies luctus "
                            "a quis. Arcu sit eu vitae amet. Placerat aliquet varius ullamcorper "
                            "senectus consequat. Cras in at nam gravida. A sed suspendisse "
                            "lobortis a eget nunc et nec scelerisque. Eget sed lacus nam "
                            "molestie egestas consequat aenean pellentesque imperdiet. "
                            "Mauris tristique tincidunt id purus massa sed ut. Pretium in "
                            "est nam amet lorem mi. Tortor sollicitudin id venenatis lacus, "
                            "non bibendum sed.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16,),
                        ),
                        const SizedBox(height: 81,),
                        ButtonWidget(
                            onPressed: (){
                              showNotedRequestDialog();
                            }, buttonText: "Show Interest", buttonColor: kGreen,
                            height: 50, width: double.maxFinite
                        ),
                        const SizedBox(height: 29,),
                        Align(alignment: Alignment.center,
                          child: TextButton(onPressed: (){
                            showRenegotiationDialog();
                          },
                              child: Text("Negotiate Loan",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 16,
                                    fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)
                          ),
                        ),
                        const SizedBox(height: 199,)
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
