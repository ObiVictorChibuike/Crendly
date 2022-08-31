import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final TextStyle? buttonTextStyle;
  final double? borderRadius;
  final Color? borderColor;

  const ButtonWidget(
      {Key? key,
      this.borderColor,
      required this.onPressed,
      required this.buttonText,
      this.buttonColor,
      required this.height,
      required this.width,
      this.buttonTextStyle,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      child: SizedBox(
        height: height ?? 55,
        width: width ?? double.maxFinite,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  side: BorderSide(color: borderColor ?? buttonColor!)),
              elevation: 0,
              primary: buttonColor),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: buttonTextStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
