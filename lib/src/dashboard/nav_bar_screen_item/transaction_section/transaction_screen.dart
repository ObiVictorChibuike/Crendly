import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../constants/color_palette.dart';
import '../../../../constants/dummy_data.dart';
import '../../../../shared_widgets/custom_appBar.dart';
class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List userTransaction = DummyData.transaction;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: CustomAppbar(centerTitle: true,
            flexibleSpace: const SizedBox(),
            title: Column(
              children: [
                Text("My Loan", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
                const SizedBox(height: 15,),
                Text("See all your transaction activities",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
              ],
            ),
            onBackPressed: (){
              Get.back();
            },
          ),
          backgroundColor: kDarkBackGroundColor,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userTransaction.isEmpty ?
              Align(alignment: Alignment.center,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: kBlue,
                        radius: 50, child: Icon(MdiIcons.calendarTextOutline, color: kWhite, size: 50,)
                    ),
                    const SizedBox(height: 40,),
                    Text("You haven't made \nany transaction yet.", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 20),)
                  ],
                ),
              ) :
              Column(
                children: [

                ],
              )
            ],
          ),
        )
    );
  }
}
