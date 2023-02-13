import 'dart:developer';

import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/string_extension.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/app/utils/loader/progress_loader.dart';
import 'package:crendly/app/utils/mixin/form_mixin.dart';
import 'package:crendly/core/state/view_state.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/otp_verification/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> with FormMixin {
  //Keys
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String initialCountry = 'NG';

  void saveOnBoardingStateOne(
      BuildContext context, RegistrationController controller) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ShowProgressDialog().show;
      await controller.saveOnBoardingStageOne();
      if (controller.viewState.state == ResponseState.COMPLETE) {
        ShowProgressDialog().hide;
        Get.offAll(() => OtpVerification());
      } else if (controller.viewState.state == ResponseState.ERROR) {
        ShowProgressDialog().hide;
        FlushBarHelper(context, controller.errorMessage).showErrorBar;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: kDarkBackGroundColor,
              appBar: CustomAppbar(
                bottomPadding: 0.0,
                title: LinearProgressIndicator(
                  color: kGreen,
                  value: 0.3,
                ),
                centerTitle: false,
                appBarLabel: Text(
                  "Phone Number",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                decorationImagePath: AssetPath.pngLemonHead,
                onBackPressed: () {
                  Get.back();
                },
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Phone number",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: IntlPhoneField(
                            validator: (value) {
                              if (value!.completeNumber.isEmpty) {
                                return 'This field is required';
                              } else if (!GetUtils.isNumericOnly(
                                      value.completeNumber.trim()) &&
                                  !GetUtils.isLengthEqualTo(
                                      value.completeNumber.trim(), 11)) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kWhite, fontSize: 16),
                            controller: controller.phoneNumberController,
                            dropdownIconPosition: IconPosition.trailing,
                            dropdownTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: const Color(0xff868484),
                                    fontSize: 16),
                            dropdownIcon: Icon(
                              Icons.arrow_drop_down,
                              color: kWhite,
                              size: 18,
                            ),
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: const Color(0xff868484),
                                      fontSize: 16),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: const Color(0xff868484),
                                      fontSize: 16),
                              labelText: 'Phone number',
                              enabledBorder: const OutlineInputBorder(
                                  gapPadding: 1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: kWhite, width: 0.7)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: kWhite, width: 0.7)),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: kWhite, width: 0.7)),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: kWhite, width: 0.7)),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: kWhite, width: 0.7)),
                              fillColor: kDarkBackGroundColor,
                              filled: true,
                              isDense: true,
                              contentPadding: const EdgeInsets.all(15),
                            ),
                            initialCountryCode: initialCountry,
                            onChanged: (phone) {
                              controller.phoneNumber = "${phone.countryCode}" +
                                  controller.phoneNumberController.text
                                      .removeLeadingZero();
                              log(phone.completeNumber);
                            },
                          )
                              // InternationalPhoneNumberInput(
                              //   validator: isPhone,
                              //   textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                              //   onInputChanged: (PhoneNumber number) {
                              //     log(controller.phoneNumberController.text);
                              //    controller.phoneNumber = "${number.dialCode}" + controller.phoneNumberController.text.removeLeadingZero();
                              //   },
                              //   onInputValidated: (bool value) {
                              //     print(value);
                              //   },
                              //   selectorConfig: SelectorConfig(
                              //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              //   ),
                              //   inputDecoration: AppTheme().phoneNumberFieldInputDecoration(context: context),
                              //   ignoreBlank: false,
                              //   autoValidateMode: AutovalidateMode.always,
                              //   hintText: "Phone number",
                              //   selectorTextStyle: Theme.of(context)
                              //       .textTheme
                              //       .bodyText2
                              //       ?.copyWith(color: kWhite, fontSize: 16),
                              //   initialValue: number,
                              //   textFieldController: controller.phoneNumberController,
                              //   formatInput: true,
                              //   keyboardType: TextInputType.numberWithOptions(
                              //       signed: true, decimal: true),
                              //
                              //   inputBorder: const OutlineInputBorder(
                              //       borderRadius: BorderRadius.all(Radius.circular(15)),
                              //       borderSide: BorderSide(color: kWhite, width: 0.7)),
                              //   onSaved: (PhoneNumber number) {
                              //     print('On Saved: $number');
                              //   },
                              // ),
                              ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: kOrange.withOpacity(0.5),
                            radius: 8,
                            child: const CircleAvatar(
                              radius: 5,
                              backgroundColor: kOrange,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "It’s adviced that you  input your phone number as it is on your BVN.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email address",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      FormFieldWidget(
                        controller: controller.emailController,
                        expands: false,
                        hintText: "newmail@mail.com",
                        validator: isValidEmailAddress,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: kOrange.withOpacity(0.5),
                            radius: 8,
                            child: const CircleAvatar(
                              radius: 5,
                              backgroundColor: kOrange,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Please provide a valid email address",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 132,
                      ),
                      ButtonWidget(
                          onPressed: () {
                            saveOnBoardingStateOne(context, controller);
                          },
                          buttonColor: kGreen,
                          borderRadius: 8,
                          buttonText: "Next",
                          height: 55,
                          width: double.maxFinite),
                     // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
