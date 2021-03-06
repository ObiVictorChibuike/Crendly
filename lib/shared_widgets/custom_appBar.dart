import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onBackPressed;
  final String? decorationImagePath;
  final Widget? title;
  final Widget? trailing;
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final bool? centerTitle;
  const CustomAppbar(
      {Key? key,
      this.onBackPressed,
      this.decorationImagePath,
      this.title,
      this.backgroundColor,
      this.flexibleSpace,
      this.trailing,
      this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? false,
      backgroundColor: backgroundColor ?? const Color(0xff4701E0),
      elevation: 0.0,
      title: title,
      flexibleSpace: flexibleSpace,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      leading: IconButton(
          onPressed: onBackPressed, icon: const Icon(Icons.arrow_back_ios, size: 20,)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 15),
          child: decorationImagePath != null
              ? Image.asset(decorationImagePath ?? "", height: 50, width: 50,)
              : Container(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
