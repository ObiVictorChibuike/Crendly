import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../constants/color_palette.dart';
import '../../../../../shared_widgets/custom_appBar.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          centerTitle: false,
          appBarLabel: Text("Terms & Conditions",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
          ),
          decorationImagePath: AssetPath.fullTag,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 23.0, right: 23.0, top: 32.0 ),
                  child: Text("Ullamcorper ullamcorper massa faucibus ullamcorper at "
                      "tortor amet id ut. Accumsan leo sit lacus nisi accumsan, aenean"
                      " nec. Nec enim lobortis urna lacus sit scelerisque tincidunt volutpat, "
                      "sed. Justo congue fames eget faucibus commodo velit proin sodales. "
                      "Aenean id feugiat tincidunt egestas et dignissim justo tellus. Sed "
                      "tempor nisl, mattis consectetur. Sollicitudin tempor at id nunc sollicitudin "
                      "laoreet eget lacus. Suspendisse eleifend a enim adipiscing odio sodales "
                      "egestas sed fames. Amet amet, non, bibendum libero in. Id ullamcorper "
                      "porttitor accumsan mollis curabitur ut amet. Integer sed id sed enim "
                      "pretium, dui orci turpis semper. Elementum at auctor platea at vel a"
                      " vulputate. Ridiculus nulla odio pretium a lectus donec interdum scelerisque. "
                      "At ut consectetur netus commodo in nulla morbi. Scelerisque arcu bibendum nulla nunc"
                      " ut et tempor, phasellus. Adipiscing sagittis vestibulum, adipiscing cursus montes. "
                      "Morbi aenean at morbi scelerisque ultricies enim egestas gravida.", textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: kWhite, ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
