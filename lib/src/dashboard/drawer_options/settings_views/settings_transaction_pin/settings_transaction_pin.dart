import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../shared_widgets/customButton.dart';
import 'create_pin.dart';

class SettingsTransactionPin extends StatelessWidget {
  const SettingsTransactionPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: AppBar(centerTitle: true, elevation: 0.0, backgroundColor: kDarkBackGroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Image.asset(AssetPath.fullTag, height: 50, width: 50,),
          )
        ],
        title: Text("Transaction PIN", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
        leading: IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: kDarkPurple,
              child: SvgPicture.asset(AssetPath.lock),
            ),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 69.0),
              child: SizedBox(
                width: 252,
                child: Text(
                  "Create a transaction PIN to secure your transaction", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => CreatePin()));
                },
                buttonColor: kGreen,
                buttonText: "Create PIN",
                borderRadius: 8,
                height: 50,
                width: 347),
          ],
        ),
      ),
    );
  }
}
