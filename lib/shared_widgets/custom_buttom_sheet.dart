
import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';

class MyBottomSheet{
  void showDismissibleBottomSheet({
    required BuildContext context,
    required List<Widget> children,
    double? height,
  }){
    showModalBottomSheet(
      backgroundColor: const Color(0xff081952),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),),),
        isScrollControlled: true, context: context,
        builder: (ctx) => Container(constraints: BoxConstraints(maxHeight: height ?? MediaQuery.of(context).size.height/1.8,),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(height: 5, width: 50,
                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
              const SizedBox(height: 30,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: children
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void showNonDismissibleBottomSheet({
    required BuildContext context,
    required List<Widget> children,
    double? height,
  }){
    showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,backgroundColor: const Color(0xff081952),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
        ),
        isScrollControlled: true,
        context: context,
        builder: (ctx) => Container(
          constraints: BoxConstraints(maxHeight: height ?? MediaQuery.of(context).size.height/1.8,),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(height: 5, width: 50,
                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5),),),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: children
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

}