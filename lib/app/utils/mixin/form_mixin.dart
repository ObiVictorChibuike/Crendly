import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin FormMixin {
  /// checks if any fields are empty
  String? isRequired(String? value) {
    if (value == null || value == '') {
      return 'This field is required';
    }
    return null;
  }

  FutureOr<String?> isPhone(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isNumericOnly(value!.trim()) ||
        !GetUtils.isLengthEqualTo(value.trim(), 11)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? isBvn(String? value) {
    if (value == null || value == '') {
      return 'This field is required';
    } else if (value.length < 11 || value.length > 11) {
      return "This bvn is not valid";
    }
    return null;
  }

  String? notEmpty(String? value) {
    if (value == null || value == '') {
      return 'This field is required';
    }
    return null;
  }

  String? isValidEmailAddress(String? value) {
    final emailAddressRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!emailAddressRegex.hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? isValidPhoneNumber(String? value) {
    // final phoneNumberRegex = RegExp(r'(^(?:[+0]9)?[0-9]{11,14}$)');
    if (value == null || value == '') {
      return 'This field is required';
    }
    // if(!phoneNumberRegex.hasMatch(value)){
    //   return 'Phone Number isn\'t Valid' ;
    // }
    return null;
  }

  /// Validates the required fields and calls a save method on the form
  bool validateAndSaveOnSubmit(BuildContext ctx) {
    final form = Form.of(ctx);
    if (form == null) {
      return false;
    }

    if (!form.validate()) {
      return false;
    }

    form.save();
    return true;
  }

  FormFieldValidator<String> validatePassword({
    String? errorMessage,
    int minLength = 4,
    int? maxLength,
    bool shouldContainNumber = false,
    bool shouldContainSpecialChars = false,
    bool shouldContainCapitalLetter = false,
    bool shouldContainSmallLetter = false,
    Function? reason,
    String Function()? onNumberNotPresent,
    String Function()? onSpecialCharsNotPresent,
    String Function()? onCapitalLetterNotPresent,
  }) {
    return (fieldValue) {
      var mainError = errorMessage;

      if (isPassword(
        fieldValue,
        minLength: minLength,
        maxLength: maxLength,
        shouldContainSpecialChars: shouldContainSpecialChars,
        shouldContainCapitalLetter: shouldContainCapitalLetter,
        shouldContainSmallLetter: shouldContainSmallLetter,
        shouldContainNumber: shouldContainNumber,
        isNumberPresent: (present) {
          if (!present) mainError = onNumberNotPresent!();
        },
        isCapitalLetterPresent: (present) {
          if (!present) mainError = onCapitalLetterNotPresent!();
        },
        isSpecialCharsPresent: (present) {
          if (!present) {
            mainError = onSpecialCharsNotPresent != null
                ? onSpecialCharsNotPresent()
                : "Password must contain special character";
          }
        },
      )) {
        return null;
      } else {
        return mainError ?? "Password must match the required format";
      }
    };
  }

  static bool isPassword(
    String? password, {
    int minLength = 4,
    int? maxLength,
    bool shouldContainNumber = false,
    bool shouldContainSpecialChars = false,
    bool shouldContainCapitalLetter = false,
    bool shouldContainSmallLetter = false,
    Function? reason,
    void Function(bool)? isNumberPresent,
    void Function(bool)? isSpecialCharsPresent,
    void Function(bool)? isCapitalLetterPresent,
    void Function(bool)? isSmallLetterPresent,
    void Function()? isMaxLengthFailed,
    void Function()? isMinLengthFailed,
  }) {
    if (password == null) {
      return false;
    }
    if (password.trim().isEmpty) {
      return false;
    }

    if (password.length < minLength) {
      if (isMinLengthFailed != null) isMinLengthFailed();
      return false;
    }

    if (maxLength != null) {
      if (password.length > maxLength) {
        if (isMaxLengthFailed != null) isMaxLengthFailed();
        return false;
      }
    }

    if (shouldContainNumber) {
      final numberRegex = RegExp(r"[0-9]+");
      if (!numberRegex.hasMatch(password)) {
        if (isNumberPresent != null) isNumberPresent(false);
        return false;
      } else if (isNumberPresent != null) {
        isNumberPresent(true);
      }
    }

    if (shouldContainCapitalLetter) {
      final capitalRegex = RegExp(r"[A-Z]+");
      if (!capitalRegex.hasMatch(password)) {
        if (isCapitalLetterPresent != null) isCapitalLetterPresent(false);
        return false;
      } else if (isCapitalLetterPresent != null) {
        isCapitalLetterPresent(true);
      }
    }

    if (shouldContainSmallLetter) {
      final smallLetterRegex = RegExp(r"[a-z]+");
      if (!smallLetterRegex.hasMatch(password)) {
        if (isSmallLetterPresent != null) isSmallLetterPresent(false);
        return false;
      } else if (isSmallLetterPresent != null) {
        isSmallLetterPresent(true);
      }
    }

    if (shouldContainSpecialChars) {
//      final numberRegex = RegExp(r'(?=.*?[#?!@$%^&*-])');
      final specialRegex = RegExp(r"[\'^£$%!&*()}{@#~?><>,.|=_+¬-]");
      if (!specialRegex.hasMatch(password)) {
        if (isSpecialCharsPresent != null) isSpecialCharsPresent(false);
        return false;
      } else if (isSpecialCharsPresent != null) {
        isSpecialCharsPresent(true);
      }
    }

    return true;
  }
}
