import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingMessage;
  const LoadingWidget({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 75,),
          WillPopScope(
              child: Stack(alignment: AlignmentDirectional.center,
                children: [
                  Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AssetPath.fullTag, height: 50, width: 50,),
                        const SizedBox(height: 5,),
                        Text(loadingMessage ?? "", style: TextStyle(fontSize:8, color: kGreen,))
                      ],
                    ),
                  ),
                  Center(child: Container(
                    height: 90,
                    width: 90,
                    color: Colors.transparent,
                    child: CircularProgressIndicator(strokeWidth: 0.9,color: kGreen,),
                  ),
                  ),
                ],
              ), onWillPop:()=>Future.value(false)),
        ],
      ),
    );
  }
}

class ShowProgressDialog{
  get hide => Get.back();
  get show => Get.to(()=> const LoadingWidget(loadingMessage: "Please wait...",));
}
