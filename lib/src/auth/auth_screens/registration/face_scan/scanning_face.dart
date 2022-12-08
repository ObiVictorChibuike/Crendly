import 'dart:async';
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/src/auth/auth_screens/registration/scan_signature/scan_signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



class ScanningFace extends StatefulWidget {
  const ScanningFace({Key? key}) : super(key: key);

  @override
  State<ScanningFace> createState() => _ScanningFaceState();
}

class _ScanningFaceState extends State<ScanningFace> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => showMyDialog(),);
    super.initState();
  }

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
                child: Center(child: SvgPicture.asset(AssetPath.faceIcon)),
              ),
            ),
            Container(height:45, width:2, color: kGreen,),
            const SizedBox(height: 30,),
            Align(alignment: Alignment.center,
              child: Text("Facial Recognition Complete", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            ),
            const SizedBox(height: 5),
            Text("Your face looks pretty nice, actually", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 12),),
            const SizedBox(height: 30,),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:60.0),
              child: CustomOutlineButton(
                  backGroundColor: const Color(0xff081952),
                  text: "Ok", height: 50,
                  onPressed: (){
                    Get.to(()=> const ScanSignature());
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
          appBar: AppBar( centerTitle: true, backgroundColor: kDarkBackGroundColor, elevation: 0.0,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen,)),
            title: Text("Scanning Face" , style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0,0.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text("Please keep your head in the circle and slowly rotate your face in multiple directions", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith( color: kWhite, fontSize: 14),),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage(AssetPath.face),
                ),
                const SizedBox(height: 60,),
                Text("100%", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
                const Spacer(flex: 5,),

              ],
            ),
          ),
        )
    );
  }
}
