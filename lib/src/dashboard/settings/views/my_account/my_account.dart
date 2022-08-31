import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/bank_account/bank_account.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/cards/bank_card.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/personal%20_information/setting_personal_information.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/security/security.dart';
import 'package:crendly/src/dashboard/settings/views/my_account/verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/custom_appBar.dart';
import '../../widgets/settings_tile.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "My Account",
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
              title: 'Personal Information',
              iconData: Icons.person,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => SettingPersonalInformation()));
              },
              subtitle: "Kindly provide your personal information",
            ),
            SettingTile(
              title: 'Verification',
              iconData: Icons.lock,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => Verification()));
              },
              subtitle: "In integer",
            ),
            SettingTile(
              title: 'Security',
              iconData: Icons.lock,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => Security()));
              },
              subtitle: "Reset your password to keep yor account safe",
            ),
            SettingTile(
              title: 'Bank Account',
              iconData: Icons.museum_outlined,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => BankAccount()));
              },
              subtitle: "View your bank information to make changes if any",
            ),
            SettingTile(
              title: 'Cards',
              iconData: Icons.credit_card_sharp,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => BankCard()));
              },
              subtitle: "Add your card details to make transactions breezy",
            ),
          ],
        ),
      ),
    );
  }
}
