import 'package:crendly/src/dashboard/settings/views/my_account/personal%20_information/bio_details.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/personal%20_information/contact_address.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/personal%20_information/identity_card.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/personal%20_information/next_of_kin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../constants/asset_path.dart';
import '../../../../../../constants/color_palette.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';
import '../../../widgets/settings_tile.dart';

class SettingPersonalInformation extends StatelessWidget {
  const SettingPersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Personal Information",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SettingTile(
              title: 'Bio details',
              iconData: Icons.person,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => BioDetails()));
              },
              subtitle: "Checkout your bio details",
            ),
            SettingTile(
              title: 'Contact Address',
              iconData: Icons.location_on,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => ContactAddress()));
              },
              subtitle: "Keep your address updated to make verification easier",
            ),
            const SizedBox(
              height: 20,
            ),
            SettingTile(
              title: 'Identity card',
              iconData: Icons.badge_rounded,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => IdentityCard()));
              },
              subtitle: "Checkout your ID card and update it when it expires",
            ),
            SettingTile(
              title: 'Next of Kin',
              iconData: Icons.group,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => NextOfKin()));
              },
              subtitle: "Add Next of kin information",
            ),
          ],
        ),
      ),
    );
  }
}
