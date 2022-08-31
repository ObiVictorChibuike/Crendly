import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/settings/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared_widgets/customButton.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';

class BankCard extends StatefulWidget {
  const BankCard({Key? key}) : super(key: key);

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  List bankCards = [];

  void addCard(String cardNumber, String expiryDate, String cvv) {
    setState(() {
      bankCards.add(
          {"cardNumber": cardNumber, "expiryDate": expiryDate, "cvv": cvv});
      print("Bank Accounts: $bankCards");
    });
  }

  void removeCard(int index) {
    setState(() {
      bankCards.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    void LinkCardBottomSheet(context) {
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
                                                "Link Card",
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
                                      controller: cardNumberController,
                                      labelTitle: "Enter Card Number",
                                      hintText: "Card number",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FormFieldWidget(
                                              controller: expiryDateController,
                                              labelTitle: "Expiry date",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              hintText: "MM/YY",
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FormFieldWidget(
                                                  controller: cvvController,
                                                  labelTitle: "CVV",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.3,
                                                  hintText: "123",
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "You will be charged a sum of N100 to "
                                      "add to your card.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: kWhite,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    ButtonWidget(
                                      onPressed: () {
                                        addCard(
                                            cardNumberController.text,
                                            expiryDateController.text,
                                            cvvController.text);
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
        body: bankCards.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 51,
                    ),
                    CustomHeader(
                      title: "Cards",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    CircleAvatar(
                      backgroundColor: kDarkPurple,
                      radius: 48,
                      child: Icon(
                        Icons.credit_card,
                        color: kWhite,
                        size: 45,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      "No Cards added",
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
                        LinkCardBottomSheet(context);
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
                      title: "Cards",
                      trailing: IconButton(
                          onPressed: () {
                            LinkCardBottomSheet(context);
                          },
                          icon: Icon(
                            Icons.add,
                            color: kOrange,
                            size: 16,
                          )),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: bankCards.length,
                        itemBuilder: (context, index) {
                          String accountName = bankCards[index]["cardNumber"];
                          String bankName = bankCards[index]["expiryDate"];
                          String accountNumber = bankCards[index]["cvv"];
                          return bankCardTile(
                              accountName, bankName, accountNumber, index);
                        })
                  ],
                ),
              ));
  }

  Widget bankCardTile(
      String cardNumber, String expiryDate, String cvv, int index) {
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
                  cardNumber,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {
                      removeCard(index);
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
            Text(expiryDate,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(
              height: 5,
            ),
            Text(cvv,
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
