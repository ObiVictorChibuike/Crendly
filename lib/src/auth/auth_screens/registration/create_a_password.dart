import 'package:crendly/shared_widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../constants/color_palette.dart';
import '../../../../shared_widgets/custom_dialog_widget.dart';
import '../../../../shared_widgets/custom_outlined_button.dart';
import '../../../../shared_widgets/cutom_appBar.dart';
import '../../../../shared_widgets/cutom_pincode_field.dart';
import 'crendly_option.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {

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
                child: Center(child: Icon(Icons.check_circle, color: kOrange, size: 50,)),
              ),
            ),
            Container(height: 55, width:2, color: kGreen,),
            const SizedBox(height: 30,),
            Align(alignment: Alignment.center,
              child: Text("Welcome to Crendly.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            ),
            const SizedBox(height: 95,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                  onPressed: (){
                    Get.back();
                    Get.to(()=> const CrendlyOption());
                  },
                  buttonText: "Continue",
                  height: 55,buttonColor: kGreen,
                  width: double.maxFinite
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
            flexibleSpace: const Padding(padding: EdgeInsets.only(top: 35.0, bottom: 10), child: LinearProgressIndicator(color: kGreen, value: 0.8,),),
            title: Text("Finally, create a \npassword", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 75, left: 24, right: 24),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text("Create a 6 - digit passcode to login \nwith into Crendly.", textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                ),
                const SizedBox(height: 80,),
                PinCodeWidget(
                    onChanged: (String value){

                    }
                ),
                const Spacer(flex: 3,),
                ButtonWidget(
                    onPressed: (){
                      showMyDialog();
                    },
                    buttonText: "Continue",
                    height: 55,buttonColor: kGreen,
                    width: double.maxFinite
                ),
                const Spacer(),
              ],
            ),
          ),
        )
    );
  }
}
