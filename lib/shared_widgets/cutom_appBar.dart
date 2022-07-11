import 'package:flutter/material.dart';

import '../constants/color_palette.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onBackPressed;
  final String? decorationImagePath;
  final Widget? title;
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final bool? centerTitle;
  const CustomAppbar({Key? key, this.onBackPressed, this.decorationImagePath, this.title, this.backgroundColor, this.flexibleSpace, this.centerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: centerTitle ?? false,
      backgroundColor: backgroundColor ?? const Color(0xff4701E0), elevation: 0.0, title: title, flexibleSpace: flexibleSpace,
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),),
      leading: IconButton(onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back_ios)), actions: [
        Padding(padding: const EdgeInsets.only(right: 15.0),
          child: Image.asset(decorationImagePath!),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
