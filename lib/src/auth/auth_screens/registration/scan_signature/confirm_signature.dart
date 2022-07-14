
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/auth/auth_screens/registration/add_bank_account.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../../shared_widgets/custom_outlined_button.dart';
import '../../../../../shared_widgets/cutom_appBar.dart';

class ConfirmSignature extends StatefulWidget {
  const ConfirmSignature({Key? key}) : super(key: key);

  @override
  State<ConfirmSignature> createState() => _ConfirmSignatureState();
}

class _ConfirmSignatureState extends State<ConfirmSignature> {
  showMyDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, MediaQuery.of(context).size.width /1.3, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 3,),
            Align(
              alignment: Alignment.center,
              child: Container(height: 80, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: Center(child: Icon(Icons.person, color: kOrange, size: 50,)),
              ),
            ),
            Container(height: 55, width:2, color: kGreen,),
            const SizedBox(height: 30,),
            Align(alignment: Alignment.center,
                child: Text("Your signature has been secured in our database.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),)),
            const SizedBox(height: 30,),
            Container(height: 55, width:2, color: kGreen,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:99.0),
              child: CustomOutlineButton(
                  backGroundColor: const Color(0xff081952),
                  text: "Ok", height: 60,
                  onPressed: (){
                    Get.to(()=> const AddBankAccount());
                  }
              ),
            ),
            const Spacer(flex: 3,),
          ],
        ),
      )
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            flexibleSpace: const Padding(padding: EdgeInsets.only(top: 35.0, bottom: 10), child: LinearProgressIndicator(color: kGreen, value: 0.5,),),
            title: Text("Signature", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 75, left: 24, right: 24),
            child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DottedBorder(color: Color(0xffC1CDF6), dashPattern: [8, 4], radius: Radius.circular(10), borderType: BorderType.RRect,
                  child: Container(width: double.maxFinite, height: MediaQuery.of(context).size.height / 5,
                      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                          child: SvgPicture.asset(AssetPath.confirmSignature, height: 100, width: 100,))),),
                const SizedBox(height: 30,),
                Text("Your signature for document \nauthentication.", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
                const Spacer(flex: 3,),
                ButtonWidget(
                    onPressed: (){
                      showMyDialog();
                    },
                    buttonText: "Continue",
                    height: 55, buttonColor: kGreen,
                    width: double.maxFinite
                ),
                const Spacer(flex: 2,),
                TextButton(onPressed: (){

                }, child: Text("Provide New Signature", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),)),
                const Spacer(),
              ],
            ),
          ),
        )
    );
  }
}
