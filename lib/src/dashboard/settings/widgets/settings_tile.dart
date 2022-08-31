import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../constants/color_palette.dart';

class SettingTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final Widget? trailing;
  final bool? toRotate;
  final int? turns;
  const SettingTile(
      {required this.iconData,
      required this.title,
      required this.subtitle,
      required this.onTap,
      this.turns,
      this.trailing,
      this.toRotate = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ListTile(
        onTap: onTap,
        leading: toRotate!
            ? Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Transform(
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(
                    iconData,
                    color: kPurple,
                  ),
                ),
              )
            : Icon(
                iconData,
                color: kPurple,
              ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kWhiteWithOpacity, fontSize: 12),
        ),
        trailing: trailing ??
            Icon(
              Icons.arrow_forward_ios,
              color: kPurple,
              size: 14,
            ),
      ),
    );
  }
}
