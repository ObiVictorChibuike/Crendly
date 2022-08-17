import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/loan_offer_and_agreement.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/notification_section/widget/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/dummy_data.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List todayNotification = DummyData.todayNotification;
  List yesterdayNotification = DummyData.yesterdayNotification;
  List maintenanceNotification = DummyData.appMaintenanceNotification;

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
                        button == "Finish Loan process" ? Get.to(()=> const LoanOfferAndAgreement()) : null;
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
