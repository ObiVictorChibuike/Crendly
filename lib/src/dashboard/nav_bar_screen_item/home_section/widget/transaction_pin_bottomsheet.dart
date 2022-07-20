import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/color_palette.dart';
import '../../../../../shared_widgets/customButton.dart';
import '../../../../../shared_widgets/cutom_pincode_field.dart';

void showPinBottomBottomSheet({required BuildContext context, required void Function()? onPressed}){
  Get.bottomSheet(FractionallySizedBox(heightFactor: 0.5,
    child: Container(decoration: BoxDecoration(color: kDarkBackGroundColor,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/1.8,), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Container(height: 5, width: 50, decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
          Expanded(
            child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: (){
                                Get.back();},
                              icon: Icon(Icons.clear, color: kOrange,)
                          ),
                        ),
                        Align(alignment: Alignment.center,
                            child: Text("Transaction Pin", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700 ),)),
                        const SizedBox(height: 80,),
                        PinCodeWidget(
                            obscuringCharacter: "*",
                            length: 4, padding: 70,
                            onChanged: (value){}
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/6,),
                        ButtonWidget(
                            onPressed: onPressed,
                            buttonText: "Continue",
                            height: 55, buttonColor: kGreen,
                            width: double.maxFinite
                        ),
                      ],
                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    ),
  ),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
    ),
    isScrollControlled: true,
  );
}