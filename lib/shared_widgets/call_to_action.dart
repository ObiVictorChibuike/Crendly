import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color_palette.dart';

class CallToAction extends StatelessWidget {
  final String assetName;
  final String actionText;
  final Color? backgroundColor;
  final double? fontSize;
  final void Function()? onTap;
  final Color? textColor;
  final FontWeight? fontWeight;
  const CallToAction(
      {required this.assetName,
      this.backgroundColor,
      required this.actionText,
      this.fontSize,
      this.onTap,
      this.textColor,
      this.fontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
              radius: 28,
              backgroundColor: backgroundColor ?? kBlue,
              child: SvgPicture.asset(assetName)),
          const SizedBox(
            height: 5,
          ),
          Text(
            actionText,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: fontSize ?? 10,
                color: textColor ?? kWhite,
                fontWeight: fontWeight ?? FontWeight.bold),
          )
        ],
      ),
    );
  }
}
