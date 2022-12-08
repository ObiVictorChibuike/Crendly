import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/shared_widgets/drop_down.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/app/utils/mixin/form_mixin.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/pages/onboarding_stage_one/phone_number_and_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../app/constants/color_palette.dart';

class DateOfBirthAndGender extends StatefulWidget {
  const DateOfBirthAndGender({Key? key}) : super(key: key);

  @override
  _DateOfBirthAndGenderState createState() => _DateOfBirthAndGenderState();
}

class _DateOfBirthAndGenderState extends State<DateOfBirthAndGender> with FormMixin{
  String? selectedGender;
  List<String> gender = ["Male", "Female"];

  //Keys
  final scaffoldKey = GlobalKey <ScaffoldState>();
  final formKey = GlobalKey <FormState>();

  _selectDateOfBirth(BuildContext context, RegistrationController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      helpText: 'SELECT DATE OF BIRTH',
      confirmText: 'SELECT',
    );
    if (picked != null) {
      setState(() {
        var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
        var inputDate = inputFormat.parse(picked.toString());
        var outputFormat = DateFormat('dd/MM/yyyy');
        controller.dateOfBirth.text = outputFormat.format(inputDate);
        print(controller.dateOfBirth.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: RegistrationController(),
        builder: (controller){
      return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            bottomPadding: 0,
            title: LinearProgressIndicator(
              color: kGreen,
              value: 0.2,
            ), centerTitle: false,
            appBarLabel: Text(
              "Date of Birth & Gender",
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
                        "Date of birth",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FormFieldWidget(
                    readOnly: true,
                    validator: isRequired,
                    controller: controller.dateOfBirth,
                    expands: false,
                    hintText: "DD/MM/YY",
                    onTap: (){
                      _selectDateOfBirth(context, controller);
                    },
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: kWhite,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                            "It’s adviced that you  input your date of birth as it is on your BVN.",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: kWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Gender", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 8,),
                  DropList(valueName: controller.genderController,
                    iterable: gender, hintText: 'Select gender',
                  ),
                  const SizedBox(height: 151.76,),
                  ButtonWidget(
                      onPressed: () {
                       if(formKey.currentState!.validate()){
                         if(controller.genderController.text.isEmpty){
                           FlushBarHelper(context, "Gender field is required").showErrorBar;
                         }else{
                           Get.to(() => const PhoneNumberScreen());
                         }
                       }
                      },
                      buttonColor: kGreen,
                      borderRadius: 8,
                      buttonText: "Next",
                      height: 50,
                      width: double.maxFinite),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
