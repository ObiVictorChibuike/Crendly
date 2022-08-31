import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/settings/widgets/custom_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';

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
      Get.bottomSheet(
          FractionallySizedBox(
            heightFactor: 0.65,
            child: Container(
                decoration: BoxDecoration(
                    color: kDarkBackGroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.8,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: StatefulBuilder(builder: (context, mySetState) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Link Banks",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        color: kWhite,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(
                                                    Icons.clear,
                                                    color: kOrange,
                                                    size: 25,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FormFieldWidget(
                                      controller: bankNameController,
                                      labelTitle: "Bank Name",
                                      hintText: "Name of Bank",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FormFieldWidget(
                                      controller: accountNumberController,
                                      labelTitle: "Account Number",
                                      hintText: "1234567890",
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 81,
                                      child: DottedBorder(
                                          color: kPurple,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Account Name",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color:
                                                                  kWhiteWithOpacity),
                                                    ),
                                                    Text("Damilare Benson",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                fontSize: 16,
                                                                color: kWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))
                                                  ],
                                                ),
                                                SvgPicture.asset(
                                                  AssetPath.bank,
                                                  height: 35,
                                                  width: 35,
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 47,
                                    ),
                                    ButtonWidget(
                                      onPressed: () {
                                        addBankAccount(bankNameController.text,
                                            accountNumberController.text);
                                        print(
                                            "BankName ${bankAccounts[0]["bankName"]}");
                                        Get.back();
                                      },
                                      buttonText: "Link Bank Account",
                                      height: 50,
                                      width: 347,
                                      buttonTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: kDarkBackGroundColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
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
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          isScrollControlled: true,
          isDismissible: false);
    }

    return Scaffold(
        backgroundColor: kDarkBackGroundColor,
        body: bankAccounts.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 51,
                    ),
                    CustomHeader(
                      title: "Bank Account",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
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
                      child: Text(
                        "You do not have any Bank Account account added yet",
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
                      buttonTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: kDarkBackGroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                      buttonColor: kGreen,
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 51,
                    ),
                    CustomHeader(
                      title: "Bank Account",
                      trailing: IconButton(
                          onPressed: () {
                            LinkBankAccountBottomSheet(context);
                          },
                          icon: Icon(
                            Icons.add,
                            color: kOrange,
                            size: 16,
                          )),
                    ),
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

  Widget bankAccountCardTile(
      String accountName, String bankName, String accountNumber, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: kBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
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
                      removeBankAccount(index);
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
            Text(accountNumber,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kLighterDisableColor, fontSize: 14)),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
