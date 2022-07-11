import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class PinCodeWidget extends StatelessWidget {
  final void Function(String)? onCompleted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final int? length;
  const PinCodeWidget({Key? key, this.onCompleted, this.controller, this.validator, required this.onChanged, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 5),
        child: PinCodeTextField(
          textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 25),
          autoDisposeControllers: false,
          controller: controller,
          onCompleted: onCompleted,
          appContext: context,
          pastedTextStyle: const TextStyle(color: Colors.black,),
          length: length ?? 6, errorTextSpace: 20,
          enablePinAutofill: false, obscureText: true,
          blinkWhenObscuring: true,
          autovalidateMode: AutovalidateMode.disabled,
          animationType: AnimationType.fade,
          validator: validator,
          pinTheme: PinTheme(
            fieldHeight: 55, fieldWidth: 55, borderRadius: BorderRadius.circular(8),
            shape: PinCodeFieldShape.box, errorBorderColor: kWhite,
            selectedColor: kWhite, selectedFillColor: Colors.transparent,
            activeColor: kWhite, activeFillColor: Colors.transparent,
            inactiveColor: kWhite, inactiveFillColor: Colors.transparent,
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
            if(text!.isNotEmpty){
              return true;
            } else {
              return false;
            }
          },
        ));
  }
}
