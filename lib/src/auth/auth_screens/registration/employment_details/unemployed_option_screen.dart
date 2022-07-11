import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../../constants/asset_path.dart';
import '../../../../../shared_widgets/customButton.dart';
import '../../../../../shared_widgets/cutom_appBar.dart';
import '../identification/means_of_identification.dart';

class UnemployedOptionScreen extends StatefulWidget {
  const UnemployedOptionScreen({Key? key}) : super(key: key);

  @override
  _UnemployedOptionScreenState createState() => _UnemployedOptionScreenState();
}

class _UnemployedOptionScreenState extends State<UnemployedOptionScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(centerTitle: true,
          flexibleSpace: const Padding(padding: EdgeInsets.only(top: 35.0, bottom: 10), child: LinearProgressIndicator(color: kGreen, value: 0.6,),),
          title: Text("Unemployed", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
          decorationImagePath: AssetPath.pngLemonHead,
          onBackPressed: (){
            Get.back();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 75, left: 24, right: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(alignment: Alignment.centerLeft,
                          child: Text("Are you politically exposed?", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                      const SizedBox(height: 15,),
                      GroupButton(
                        options: GroupButtonOptions(
                            selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                            unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                            unselectedColor: Colors.transparent, mainGroupAlignment: MainGroupAlignment.start,
                            unselectedBorderColor: kWhite, crossGroupAlignment: CrossGroupAlignment.start,
                            borderRadius: BorderRadius.circular(25),selectedColor: const Color(0xff8095E0),
                            buttonHeight: 50, buttonWidth: MediaQuery.of(context).size.width / 2.3
                        ),
                        isRadio: false, enableDeselect: true,
                        onSelected: (String value, index, isSelected){

                        },
                        buttons: ["Yes, I do", "No, I don’t"], maxSelected: 1,
                      ),
                      const Spacer(flex: 3,),
                      ButtonWidget(
                          onPressed: (){
                            Get.to(()=> const MeansOfIdentification());
                          },
                          buttonColor: kGreen, borderRadius: 8,
                          buttonText: "Next",
                          height: 55, width: double.maxFinite
                      ),
                      const Spacer(),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
