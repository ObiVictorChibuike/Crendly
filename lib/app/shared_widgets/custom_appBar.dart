import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onBackPressed;
  final String? decorationImagePath;
  final Widget? title;
  final Widget? trailing;
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final bool? centerTitle;
  final Color? backButtonColor;
  final Widget? leadingWidget;
  final Widget? appBarLabel;
  final Widget? actionWidget;
  final double? height;
  final double? bottomPadding;
  const CustomAppbar(
      {Key? key,
      this.onBackPressed,
      this.decorationImagePath,
      this.title,
      this.backgroundColor,
      this.flexibleSpace,
      this.trailing,
      this.centerTitle,
        this.backButtonColor,
        this.leadingWidget, this.appBarLabel, this.actionWidget, this.height, this.bottomPadding,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? const Color(0xff4701E0), elevation: 0.0,
      title: Padding(padding: const EdgeInsets.only(top: 15.0),
        child: title,
      ), bottom: PreferredSize(
      preferredSize: const Size.fromHeight(10.0),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: bottomPadding ?? 18.0),
                child: IconButton(onPressed: onBackPressed, icon: Icon(Icons.arrow_back_ios, size: 20, color: backButtonColor ?? kWhite,)),
              ),
              appBarLabel ?? const SizedBox(),
              centerTitle == false ? const Spacer(flex: 4,) : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15),
                child: decorationImagePath != null
                    ? Image.asset(decorationImagePath ?? "", height: 50, width: 50,)
                    : actionWidget,
              )
            ],
          ),
          const SizedBox(height: 30,),
        ],
      ),
    ),
      flexibleSpace: flexibleSpace ?? const SizedBox(height: 50,),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      leading: leadingWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 125);
}
