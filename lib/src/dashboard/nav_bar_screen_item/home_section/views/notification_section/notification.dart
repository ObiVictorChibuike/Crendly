import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/dummy_data.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List userData = DummyData.userData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(backgroundColor: kDarkBackGroundColor, elevation: 0.0,
            title: Text("Notifications", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700),),
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
          ),
          backgroundColor: kDarkBackGroundColor,
          body: userData.isEmpty ? Align(alignment: Alignment.center,
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
          ) : Column(
            children: [

            ],
          )
        )
    );
  }
}
