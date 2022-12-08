import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  final void Function(String)? onCompleted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final int? length;
  final double? padding;
  final Color? inactiveFillColor;
  final String? obscuringCharacter;
  final EdgeInsetsGeometry? outerPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? obscureText;
  const PinCodeWidget(
      {Key? key,
      this.inactiveFillColor,
      this.obscureText,
      this.mainAxisAlignment,
      this.onCompleted,
      this.outerPadding,
      this.controller,
      this.validator,
      required this.onChanged,
      this.length,
      this.padding,
      this.obscuringCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: padding ?? 5),
        child: PinCodeTextField(
          scrollPadding: const EdgeInsets.symmetric(horizontal: 21),
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          textStyle: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: kWhite, fontSize: 25),
          autoDisposeControllers: false,
          controller: controller,
          onCompleted: onCompleted,
          appContext: context, obscuringCharacter: obscuringCharacter ?? '●',
          pastedTextStyle: const TextStyle(
            color: Colors.black,
          ),
          length: length ?? 6, errorTextSpace: 20,
          enablePinAutofill: false, obscureText: obscureText ?? true,
          blinkWhenObscuring: true,
          autovalidateMode: AutovalidateMode.disabled,
          animationType: AnimationType.fade,
          validator: validator,
          pinTheme: PinTheme(
            fieldHeight: 50,
            fieldWidth: 45,
            fieldOuterPadding: outerPadding,
            borderRadius: BorderRadius.circular(4),
            shape: PinCodeFieldShape.box,
            errorBorderColor: kWhite,
            selectedColor: kWhite,
            selectedFillColor: Colors.transparent,
            activeColor: kWhite, borderWidth: 1,
            activeFillColor: Colors.transparent,
            inactiveColor: inactiveFillColor ?? kWhite,
            inactiveFillColor: inactiveFillColor ?? Colors.transparent,
          ),
          cursorColor: kWhite,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          // errorAnimationController: errorController,
          // controller: pinController,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          // resetPasswordController.otp = value;
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            if (text!.isNotEmpty) {
              return true;
            } else {
              return false;
            }
          },
        ));
  }
}
