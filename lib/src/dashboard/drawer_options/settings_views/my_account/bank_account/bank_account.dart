import 'dart:async';
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  List bankAccounts = [];

  void addBankAccount(String bankName, String accountNumber) {
    setState(() {
      bankAccounts.add({
        "bankName": bankName,
        "accountNumber": accountNumber,
        "accountName": "Damilare Benson"
      });
      print("Bank Accounts: $bankAccounts");
    });
  }

  void removeBankAccount(int index) {
    setState(() {
      bankAccounts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    void LinkBankAccountBottomSheet(context) {
      Get.bottomSheet(FractionallySizedBox(
        heightFactor: 0.65, child: Container(
          decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.8,),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: StatefulBuilder(builder: (context, mySetState) {
            return Column(
              children: [
                const SizedBox(height: 10,),
                Expanded(child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Link Banks", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
                                      IconButton(onPressed: () {Get.back();},
                                          icon: Icon(Icons.clear, color: kOrange, size: 25,))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            FormFieldWidget(
                              filledColor: kLightBackGroundColor,
                              controller: bankNameController,
                              labelTitle: "Bank Name",
                              hintText: "Name of Bank",
                            ),
                            const SizedBox(height: 10,),
                            FormFieldWidget(
                              filledColor: kLightBackGroundColor,
                              controller: accountNumberController,
                              labelTitle: "Account Number",
                              hintText: "1234567890",
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(height: 81, child: DottedBorder(color: kPurple,
                                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Account Name", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, color: kWhiteWithOpacity),),
                                            Text("Damilare Benson", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: kWhite, fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                        SvgPicture.asset(AssetPath.bank, height: 35, width: 35,)
                                      ],
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 47,),
                            ButtonWidget(onPressed: () {
                              addBankAccount("Kuda Bank", "1991099291");
                              //addBankAccount(bankNameController.text, accountNumberController.text);
                              // print("BankName ${bankAccounts[0]["bankName"]}");
                              Get.back();
                              },
                              buttonText: "Link Bank Account",
                              height: 50, width: 347,
                              buttonColor: kGreen,
                            )
                          ],
                        )
                      ]),
                ),
                ),
              ],
            );
          })),
      ), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),), isScrollControlled: true, isDismissible: false);
    }

    return Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(
          backgroundColor: kDarkBackGroundColor, centerTitle: true, elevation: 0.0,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          title: Text("Bank Account", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
          actions: [
            bankAccounts.isEmpty ? const SizedBox() : IconButton(onPressed: (){
              LinkBankAccountBottomSheet(context);
            }, icon: Icon(Icons.add, color: kOrange,))
          ],
        ),
        body: bankAccounts.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: kDarkPurple,
                      radius: 48,
                      child: SvgPicture.asset(AssetPath.bank),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      "No Bank Account added",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56.0),
                      child: Text("You do not have any Bank Account account added yet",textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: kWhiteWithOpacity,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 121,
                    ),
                    ButtonWidget(
                      onPressed: () {
                        LinkBankAccountBottomSheet(context);
                      },
                      buttonText: "Link Bank Account",
                      height: 50,
                      width: 347,
                      buttonColor: kGreen,
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: bankAccounts.length,
                        itemBuilder: (context, index) {
                          String accountName =
                              bankAccounts[index]["accountName"];
                          String bankName = bankAccounts[index]["bankName"];
                          String accountNumber =
                              bankAccounts[index]["accountNumber"];
                          return bankAccountCardTile(
                              accountName, bankName, accountNumber, index);
                        })
                  ],
                ),
              ));
  }

  showAccountDeletedSuccessDialog(){
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
                  child: const Center(child: Icon(Icons.delete, color: kOrange, size: 35,)),
                ),
              ),
              Container(height: 45, width:2, color: kGreen,),
              const SizedBox(height: 30,),
              Align( alignment: Alignment.center,
                  child: Text("Bank Account deleted \nsuccessfully", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
              const SizedBox(height: 15,),
              Align( alignment: Alignment.center,
                child: Text("Your bank account was deleted \nsuccesfully.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
              ),
              const Spacer(flex: 4,),
            ],
          ),
        ),
      )
    ]);
  }


  void showDeleteAccountBottomSheet(BuildContext context, int index){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/2.5,
        children: [
          Align(alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.clear, color: kOrange,),),
          ),
          const SizedBox(height: 30,),
          Align(alignment: Alignment.center,
            child: Text("Delete Bank Account", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          const SizedBox(height: 12,),
          Align(alignment: Alignment.center,
            child: Text("Are you sure you want to delete \nthis Bank Account?", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16)),
          ),
          const SizedBox(height: 66,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                Get.back();
                removeBankAccount(index);
                showAccountDeletedSuccessDialog();
                Timer(const Duration(seconds: 3), () => Get.offAll(()=> const BottomNavigationBarScreen()));
              }, child: Text("Yes, Delete Account",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kRedPink, decoration: TextDecoration.underline, fontSize: 16, fontWeight: FontWeight.w700),)),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(8)),
                  child: Text("No, Keep Account",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kDarkBackGroundColor, fontWeight: FontWeight.w700, fontSize: 16),),
                ),
              )
            ],
          )
        ]
    );
  }

  Widget bankAccountCardTile(
      String accountName, String bankName, String accountNumber, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: kBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  accountName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {
                      showDeleteAccountBottomSheet(context, index);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: kOrange,
                    ))
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Text(bankName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(
              height: 5,
            ),
            Text(accountNumber, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kLighterDisableColor, fontSize: 14)),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
