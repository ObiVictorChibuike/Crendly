import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../constants/color_palette.dart';
import '../../../../../../../shared_widgets/custom_appBar.dart';

class LoanRequestAndOffers extends StatefulWidget {
  const LoanRequestAndOffers({Key? key}) : super(key: key);

  @override
  State<LoanRequestAndOffers> createState() => _LoanRequestAndOffersState();
}

class _LoanRequestAndOffersState extends State<LoanRequestAndOffers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: CustomAppbar(centerTitle: false,
            appBarLabel:  Text("Loan Requests & Offers",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Column(
            children: [

            ],
          ),
        )
    );
  }
}
