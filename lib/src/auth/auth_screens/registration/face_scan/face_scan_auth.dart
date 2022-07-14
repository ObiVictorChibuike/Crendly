import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../shared_widgets/custom_outlined_button.dart';

class FaceScanAuth extends StatefulWidget {
  const FaceScanAuth({Key? key}) : super(key: key);

  @override
  State<FaceScanAuth> createState() => _FaceScanAuthState();
}

class _FaceScanAuthState extends State<FaceScanAuth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 35.0, bottom: 10),
            child: LinearProgressIndicator(
              color: kGreen,
              value: 0.5,
            ),
          ),
          title: Text(
            "Let’s verify your \naddress too.",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                primary: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 75.0,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AssetPath.faceScan,
                          height: 300,
                          width: 300,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "An Extra Authentication \nwith your face",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Scan your face to verify your identity",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: kOrange, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5.5,
                    ),
                    CustomOutlineButton(text: "Scan Face", onPressed: () {}),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Do this Later",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kGreen,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                          )),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}