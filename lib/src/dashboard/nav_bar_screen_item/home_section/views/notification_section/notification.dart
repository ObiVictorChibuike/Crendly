import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/loan_negotiation_request/view/loan_negotiation_request.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/loan_offer_letter/view/finish_loan_offer.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/widget/notification_tile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/dummy_data.dart';
import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';
import '../../widget/transaction_pin_bottomsheet.dart';
import '../view-all/view_all_loan_request_details.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List todayNotification = DummyData.todayNotification;
  List yesterdayNotification = DummyData.yesterdayNotification;
  List maintenanceNotification = DummyData.appMaintenanceNotification;
  List userData = DummyData.userData;

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
                height: 55, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: CustomAppbar(centerTitle: false,
            appBarLabel:  Text("Notifications", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
            onBackPressed: (){
              Get.back();
            },
          ),
          backgroundColor: kDarkBackGroundColor,
          body: todayNotification.isEmpty || yesterdayNotification.isEmpty || maintenanceNotification.isEmpty ? Align(alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kBlue,
                  radius: 50, child: Icon(Icons.notifications_none_rounded, size: 50, color: kWhite,),
                ),
                const SizedBox(height: 40,),
                Text("No Notifications yet", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 20),),
                const SizedBox(height: 10,),
                Text("You do not have any notifications yet.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 14),),
                const SizedBox(height: 100,),
              ],
            ),
          ) : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("TODAY", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.bold,color: kWhite),),
                  const SizedBox(height: 20,),
                  ...List.generate(todayNotification.length, (index) {
                    final button = todayNotification[index]["btnText"];
                    final msg = todayNotification[index]["msg"];
                    final time = todayNotification[index]["time"];
                    final title = todayNotification[index]["title"];
                    return NotificationTile(
                      onTap: (){
                        button == "Finish Loan process" ? Get.to(()=> FinishLoanOffer()) :
                        button == "View negotiation request" ? Get.to(()=> LoanNegotiationRequest()) : null;
                      },
                      title: title,
                      action: time,
                      body: msg,
                      btnText: button,
                    );
                  }),
                  const SizedBox(height: 30,),
                  Text("YESTERDAY", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.bold,color: kWhite),),
                  const SizedBox(height: 20,),
                  ...List.generate(yesterdayNotification.length, (index) {
                    final button = yesterdayNotification[index]["btnText"];
                    final msg = yesterdayNotification[index]["msg"];
                    final time = yesterdayNotification[index]["time"];
                    final title = yesterdayNotification[index]["title"];
                    return NotificationTile(
                      onTap: (){
                        button == "View negotiation request" ? Get.to(()=> LoanNegotiationRequest()) :
                        button == "Topup Wallet" ? showTopUPWalletBottomSheet() : button == "View Request" ? Get.to(()=> const AllLoanRequestDetails()) : null;
                      },
                      title: title,
                      action: time,
                      body: msg,
                      btnText: button,
                    );
                  }),
                  const SizedBox(height: 30,),
                  Text("YESTERDAY", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.bold,color: kWhite),),
                  const SizedBox(height: 20,),
                  ...List.generate(maintenanceNotification.length, (index) {
                    final msg = maintenanceNotification[index]["msg"];
                    final time = maintenanceNotification[index]["time"];
                    final title = maintenanceNotification[index]["title"];
                    return NotificationTile(
                      onTap: (){},
                      title: title,
                      action: time,
                      body: msg,
                    );
                  })
                ],
              ),
            ),
          )
        )
    );
  }
}
