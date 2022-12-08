import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FinishLoanOffer extends StatefulWidget {
  const FinishLoanOffer({Key? key}) : super(key: key);

  @override
  State<FinishLoanOffer> createState() => _FinishLoanOfferState();
}

class _FinishLoanOfferState extends State<FinishLoanOffer> {

  bool isAgreedLoan = false;

  showSuccessDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.9, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
            ),
            const SizedBox(height: 31,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 41, width:2, color: kGreen,),
            const SizedBox(height: 7,),
            Text("Good news! Your funds have \nbeen credited to your wallet.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Supporting you feels so good!", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.back();
                  showRatingDialog();
                },
                buttonText: "Continue",
                height: 50, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      )
    ]);
  }

  showRejectionDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.9, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
            ),
            const SizedBox(height: 31,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 41, width:2, color: kGreen,),
            const SizedBox(height: 7,),
            Text("You have rejected this \nloan offer.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Something wrong with the offer? \nPlease tell us why you rejected \nthis offer?", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),

          ],
        ),
      )
    ]);
  }

  showFeedBackDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.9, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
            ),
            const SizedBox(height: 31,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80, margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 41, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Text("Your feedback and review has \nbeen submitted", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const Spacer(flex: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.offAll(()=> BottomNavigationBarScreen());
                },
                buttonText: "Continue",
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

  Widget _rejectionCommentForm(){
    var maxLine = 8;
    return Container(margin: const EdgeInsets.symmetric(horizontal: 5), height: maxLine * 20.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: TextField(
        textInputAction: TextInputAction.next, keyboardType: TextInputType.name,
        maxLines: maxLine,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          fillColor: Colors.transparent,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.all(15),
        ),
        cursorColor: kPaleBlue,
        onChanged: (value){

        },
      ),
    );
  }

  Widget _commentForm(){
    var maxLine = 8;
    return Container(margin: const EdgeInsets.symmetric(horizontal: 25), height: maxLine * 15.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: TextField(
        textInputAction: TextInputAction.next, keyboardType: TextInputType.name,
        maxLines: maxLine,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPaleBlue, width: 0.7)
          ),
          fillColor: Colors.transparent,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.all(15),
        ),
        cursorColor: kPaleBlue,
        onChanged: (value){

        },
      ),
    );
  }

  showRejectCommentBottomSheet(){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.75,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reason for Offer Rejection", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, color: kOrange,),),
            ],
          ),
          Text("State your reason for rejecting this \nLoan Offer.", textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 14),),
          const SizedBox(height: 42),
          _rejectionCommentForm(),
          const SizedBox(height: 69,),
          ButtonWidget(onPressed: (){
            Get.back();
            showRejectionDialog();
          },
            buttonText: "Continue", height: 50,
            width: double.maxFinite, buttonColor: kGreen,
          )
        ]
    );
  }

  showRatingDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.55, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.clear, color: kOrange, size: 20,)),
              ),
              const SizedBox(height: 21,),
              Text("Rate your experience \nwith the crendly app.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700,),),
              const SizedBox(height: 33,),
              RatingBar.builder(
                initialRating: 4, minRating: 1, direction: Axis.horizontal,
                allowHalfRating: true, unratedColor: Color(0xffC4C4C4),
                itemCount: 5, itemSize: 20, itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(Icons.star, color: Color(0xff2E4DBD),),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(height: 20,),
              Text("Write a comment", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
              const SizedBox(height: 8,),
              _commentForm(),
              const SizedBox(height: 19,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                    showFeedBackDialog();
                  },
                  buttonText: "Continue",
                  height: 50, buttonColor: kGreen,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(height: 36,),
              TextButton(onPressed: (){},
                  child: Text("Not Now", style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700,fontSize: 16, decoration: TextDecoration.underline),),
              )
            ],
          ),
        ),
      )
    ]);
  }

  void showSignatureBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/2,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sign offer letter", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, color: kOrange,),),
            ],
          ),
          const SizedBox(height: 53,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AssetPath.topLeftBracket),
              SvgPicture.asset(AssetPath.topRightBracket),
            ],
          ),
          Align(alignment: Alignment.center,
              child: SvgPicture.asset(AssetPath.signature, width: 100, height: 50,)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AssetPath.bottomLeftBracket),
              SvgPicture.asset(AssetPath.bottomRightBracket),
            ],
          ),
          const SizedBox(height: 83,),
          ButtonWidget(onPressed: (){
            Get.back();
            showSuccessDialog();
          },
              buttonText: "Continue", height: 50,
              width: double.maxFinite, buttonColor: kGreen,
          )
        ]
    );
  }
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
                        showSignatureBottomSheet(context);
                      },
                      buttonText: "I accept Loan offer", buttonColor: kGreen,
                      height: 50, width: double.maxFinite
                  ),
                  const SizedBox(height: 20,),
                  Align(alignment: Alignment.center,
                    child: TextButton(onPressed: (){
                      showRejectCommentBottomSheet();
                    },
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
