
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../constants/dummy_data.dart';
import '../../../../../../../../shared_widgets/customButton.dart';

class FinishLoanOffer extends StatefulWidget {
  const FinishLoanOffer({Key? key}) : super(key: key);

  @override
  State<FinishLoanOffer> createState() => _FinishLoanOfferState();
}

class _FinishLoanOfferState extends State<FinishLoanOffer> {

  bool isAgreedLoan = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            centerTitle: false,
            appBarLabel: Text("Loan offer letter and \nagreements",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 21,),
                  RichText(
                    text: TextSpan(text: 'Loan Offer Issued to: ', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOffWhite, fontSize: 14, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: 'Danny Rand', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700,))
                        ]),
                  ),
                  const SizedBox(height: 35,),
                  RichText(
                    text: TextSpan(text: 'Borrower’s name: ', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOffWhite, fontSize: 14, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: 'Danny Rand', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700,))
                        ]),
                  ),
                  const SizedBox(height: 16,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Borrower's \naddress", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontWeight: FontWeight.w400, fontSize: 16)),
                      Text("3891 Ranchview Dr. \nRichardson, California 62639", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Text("Hi Danny,", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 12,),
                  Container(
                    width: double.maxFinite,
                    child: Text("I refer to our prior correspondence "
                        "on the subject and I am pleased to offer the "
                        "below-mentioned loan offer to you, under the "
                        "terms and conditions stated below:",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                  ),
                  const SizedBox(height: 16,),
                  Container(width: double.maxFinite, padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.circular(8),),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            Text("Tenor", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₦ 65,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("6 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        const SizedBox(height: 19,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Monthly repayment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            Text("Interest rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₦ 15,500", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("2% Monthly", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        const SizedBox(height: 25,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Disbursment account", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            Text("Account number", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Access Bank", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("0137648847", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        const SizedBox(height: 13,),
                        const Divider(color: Color(0xff2E4DBD),),
                        const SizedBox(height: 11,),
                        Align(alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(text: 'Crendly Charges ',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 12, fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(text: '₦500', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 12, fontWeight: FontWeight.w700,))
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 11,),
                  Text("Conditions Precedent to Drawdown", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                  const SizedBox(height: 6,),
                  ...List.generate(DummyData.conditions.length, (index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Text(DummyData.conditions[index]["nos"]!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 14),),
                          const SizedBox(width: 10,),
                          Expanded(child:Text(DummyData.conditions[index]["conditions"]!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 14),))
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 24,),
                  Text("The above summary terms and conditions are preliminary and are subject to change "
                      "and do not purport to summarize all of the terms and conditions contained in "
                      "definitive legal documentation for this loan facility contemplated hereby."
                      "Please indicate your acceptance of the above facility and the terms and conditons "
                      "by signing this letter, within 3 (three) days from the date of this letter, failing "
                      "which the offer shall lapse without any liability or commitment on the part of "
                      "the Lender.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 34,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("I agree to the term of this Loan Offer",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOffWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                      CupertinoSwitch(
                          value: isAgreedLoan, activeColor: kWhite,
                          thumbColor: isAgreedLoan == false ? kBlue : kGreen,
                          trackColor: isAgreedLoan == false ? kBlue.withOpacity(0.3) : kWhite,
                          onChanged: (value){
                            setState(() {
                              isAgreedLoan = !isAgreedLoan;
                            });
                          })
                    ],
                  ),
                  const SizedBox(height: 34,),
                  Align(alignment: Alignment.center,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_copy_outlined, color: kGreen,),
                        const SizedBox(width: 10,),
                        Text("View Full Contract", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, color: kGreen),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 48,),
                  ButtonWidget(
                      onPressed: (){

                      },
                      buttonText: "I accept Loan offer", buttonColor: kGreen,
                      height: 50, width: double.maxFinite
                  ),
                  const SizedBox(height: 20,),
                  Align(alignment: Alignment.center,
                    child: TextButton(onPressed: (){},
                      child: Text("Reject Loan Offer",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, color: kGreen, decoration: TextDecoration.underline )),),
                  ),
                  const SizedBox(height: 96,),
                ],
              ),
            ),
          )
        )
    );
  }
}
