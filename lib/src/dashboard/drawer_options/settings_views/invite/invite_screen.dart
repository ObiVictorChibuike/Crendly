import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // onShared()async{
    //   await Share.share(
    //     "Share this file",
    //   );
    // }
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            backgroundColor: kDarkBackGroundColor,elevation: 0.0, centerTitle: true,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, size: 20, color: kGreen,)),
            title: Text("Invite Friends", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700,fontSize: 20),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Invite a friends to join the \nCrendly Crew.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                const SizedBox(height: 17,),
                Container(
                  height: MediaQuery.of(context).size.height/1.8, width: double.maxFinite,
                  decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(21),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AssetPath.network),
                      const SizedBox(height: 18,),
                      Text("Invite your friends, get them to sign up \nusing your unique invite link and earn \nwhen the repay loans.", textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                      const SizedBox(height: 39,),
                      TextButton(onPressed: (){},
                          child: Text("Crendlyfam/Damiben186",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 29,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: (){
                      Share.share(
                        "Share this file",
                      );
                    },
                      splashColor: Colors.transparent,
                      child: Container(height: 40,width: 40, decoration: BoxDecoration(color: kBlue, shape: BoxShape.circle),
                      child: Icon(Icons.share_outlined, color: kWhite, ),),
                    ),
                    const SizedBox(width: 15,),
                    InkWell(onTap: (){
                      print("copy");
                      FlutterClipboard.copy('hello flutter friends').then(( value ){
                        BotToast.showText(text:"Link Copied");
                      });
                    },
                      splashColor: Colors.transparent,
                      child: Container(height: 40,width: 40, decoration: BoxDecoration(color: kBlue, shape: BoxShape.circle),
                        child: Icon(Icons.copy, color: kWhite, ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
