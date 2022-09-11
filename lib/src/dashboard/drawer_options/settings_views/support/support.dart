import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/custom_appBar.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        appBarLabel: Text("Support",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 21,
              ),
              Text(
                "Call us",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              supportTile(context, "080123456789"),
              supportTile(context, "080123456789"),
              supportTile(context, "080123456789"),
              supportTile(context, "080123456789"),
              const SizedBox(height: 40),
              Text(
                "Social Media",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              socialMediaTile(context, AssetPath.instagram, "@beCrendly"),
              socialMediaTile(context, AssetPath.facebook, "CrendlyCrendly"),
              socialMediaTile(context, AssetPath.twitter, "@BeCrendly"),
              socialMediaTile(context, AssetPath.web, "@www.crendly.com"),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Email Us",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              socialMediaTile(
                  context, AssetPath.instagram, "contact@crendly.com"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget supportTile(context, String phoneNumber) {
  return Column(
    children: [
      const SizedBox(
        height: 18,
      ),
      Row(
        children: [
          Icon(
            Icons.headset_mic,
            color: kPurple,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            phoneNumber,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      const Divider(
        color: kLightBackGroundColor,
      )
    ],
  );
}

Widget socialMediaTile(context, String assetName, String socialMediaHandle) {
  return Column(
    children: [
      const SizedBox(
        height: 18,
      ),
      Row(
        children: [
          SvgPicture.asset(assetName),
          const SizedBox(
            width: 11,
          ),
          Text(
            socialMediaHandle,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      const Divider(
        color: kLightBackGroundColor,
      )
    ],
  );
}
