import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHeader extends StatelessWidget {
  final Widget? trailing;
  final String title;
  final TextStyle? titleTextStyle;
  const CustomHeader(
      {this.trailing, this.titleTextStyle, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kLightGreen,
            size: 20,
          )),
      Expanded(
          child: Center(
        child: Text(
          title,
          style: titleTextStyle ??
              Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 20, color: kWhite, fontWeight: FontWeight.bold),
        ),
      )),
      trailing ?? Container()
    ]);
  }
}
