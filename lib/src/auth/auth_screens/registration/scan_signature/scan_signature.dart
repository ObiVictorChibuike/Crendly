
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/auth/auth_screens/registration/scan_signature/confirm_signature.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../shared_widgets/custom_buttom_sheet.dart';

class ScanSignature extends StatefulWidget {
  const ScanSignature({Key? key}) : super(key: key);

  @override
  State<ScanSignature> createState() => _ScanSignatureState();
}

class _ScanSignatureState extends State<ScanSignature> {
  void showSignatureSelectionOptionBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/3,
        children: [
          Align(alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.clear, color: kOrange,),),
          ),
          const SizedBox(height: 10,),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(onTap: (){
                    Get.back();
                    Get.to(()=> const ConfirmSignature());
                  },
                    child: Container(
                      height: 80, width: 80,
                      decoration: BoxDecoration(color: Color(0xff2E4DBD),),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SvgPicture.asset(AssetPath.scanPicture, height: 50, width: 50,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text("Scan Signature", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),)
                ],
              ),
              const SizedBox(width: 50,),
              Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(onTap: (){
                    Get.back();
                    Get.to(()=> const ConfirmSignature());
                  },
                    child: Container(
                      height: 80, width: 80,
                      decoration: BoxDecoration(color: Color(0xff2E4DBD),),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SvgPicture.asset(AssetPath.fileUpload, height: 50, width: 50,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text("From File", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),)
                ],
              ),
            ],
          )
        ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(color: kGreen, value: 0.5,), centerTitle: false,
            appBarLabel: Text("Signature", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 24, right: 24),
            child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DottedBorder(color: Color(0xffC1CDF6), dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
                    child: Container(width: double.maxFinite, height: MediaQuery.of(context).size.height / 5,
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                            child: SvgPicture.asset(AssetPath.signature, height: 100, width: 100,))),),
                const SizedBox(height: 30,),
                Text("Your signature for document \nauthentication.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
                const SizedBox(height: 20,),
                Text("Please upload your signature", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: kWhite),),
                const Spacer(flex: 3,),
                CustomOutlineButton(
                  color: kGreen, height: 50,
                    text: "Upload Signature", onPressed: (){
                  showSignatureSelectionOptionBottomSheet(context);

                }),
                const Spacer(flex: 2,),
                TextButton(onPressed: (){

                }, child: Text("Do this Later", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)),
                const Spacer(),
              ],
            ),
          ),
        )
    );
  }
}
