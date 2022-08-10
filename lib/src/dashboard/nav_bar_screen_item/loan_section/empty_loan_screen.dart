import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../constants/dummy_data.dart';
import '../../../../shared_widgets/custom_appBar.dart';

class EmptyLoanScreen extends StatefulWidget {
  const EmptyLoanScreen({Key? key}) : super(key: key);

  @override
  State<EmptyLoanScreen> createState() => _EmptyLoanScreenState();
}

class _EmptyLoanScreenState extends State<EmptyLoanScreen> {
  List userLoan = DummyData.myLoan;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: CustomAppbar(
            centerTitle: true,
            flexibleSpace: const SizedBox(),
            title: Column(
              children: [
                Text(
                  "My Loan",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "See all your loan activities",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
            onBackPressed: () {
              Get.back();
            },
          ),
          backgroundColor: kDarkBackGroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: kBlue, radius: 50,
                        child: Icon(MdiIcons.handCoinOutline,
                          color: kWhite, size: 50,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Text("You haven't take or \ngiven any Loan yet.",
                      textAlign: TextAlign.center, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 20),)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
