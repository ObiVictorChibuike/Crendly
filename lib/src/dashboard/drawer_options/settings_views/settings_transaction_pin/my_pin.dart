import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_pincode_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'create_pin.dart';

class MyPin extends StatefulWidget {
  const MyPin({Key? key}) : super(key: key);

  @override
  State<MyPin> createState() => _MyPinState();
}

class _MyPinState extends State<MyPin> {
  bool obscureText = true;

  void isObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Create PIN",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.082,
            ),
            Text(
              "My PIN",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            PinCodeWidget(
              padding: 80,
              obscureText: obscureText,
              inactiveFillColor: kLightBackGroundColor,
              mainAxisAlignment: MainAxisAlignment.start,
              length: 4,
              outerPadding: const EdgeInsets.only(right: 11),
              onChanged: (String value) {},
            ),
            const SizedBox(
              height: 46,
            ),
            TextButton(
                onPressed: () {
                  isObscureText();
                },
                child: Text(
                  obscureText ? "Hide My PIN" : "View My PIN",
                  style: TextStyle(
                      color: kLightGreen,
                      fontFamily: "Sansation",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.26,
            ),
            ButtonWidget(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => CreatePin()));
              },
              buttonText: "Setup New PIN",
              height: 50,
              width: 347,
              buttonTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kDarkBackGroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
              buttonColor: kGreen,
            )
          ],
        ),
      ),
    );
  }
}
