import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/settings/views/settings_transaction_pin/create_pin.dart';
import 'package:crendly/src/dashboard/settings/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../shared_widgets/customButton.dart';

class SettingsTransactionPin extends StatelessWidget {
  const SettingsTransactionPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            const SizedBox(
              height: 52,
            ),
            CustomHeader(
              title: "Transaction PIN",
              titleTextStyle: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),
              trailing: Image.asset(
                AssetPath.fullTag,
                width: 52,
                height: 52,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
            ),
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
                  "Create a transaction PIN to secure your transaction",
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
