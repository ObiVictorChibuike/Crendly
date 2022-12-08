import 'dart:developer';
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/app/shared_widgets/drop_down.dart';
import 'package:crendly/app/utils/flush_bar/flushbar_helper.dart';
import 'package:crendly/app/utils/mixin/form_mixin.dart';
import 'package:crendly/presentation/modules/registration%20&%20onboarding/controller/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'marital_status.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> with FormMixin{
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
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(
              color: kGreen,
              value: 0.35,
            ), centerTitle: false,
            appBarLabel: Text(
              "Your Personal \nInformation",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 24, right: 25),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Text("Please confirm the personal information gotten from your BNV below is correct.",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("First Name", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 10,),
                            FormFieldWidget(
                              controller: controller.firstName,
                              expands: false,
                              hintText: "Emmanuel",
                              validator: isRequired,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 6,
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last Name", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),),
                            const SizedBox(
                              height: 10,
                            ),
                            FormFieldWidget(
                              controller: controller.lastName,
                              expands: false,
                              hintText: "David",
                              validator: isRequired,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  DropList(valueName: controller.genderController,
                    iterable: gender, hintText: 'Select gender',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
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
                    controller: controller.dateOfBirth,
                    expands: false,
                    hintText: "08/08/1994",
                    onTap: (){
                      _selectDateOfBirth(context, controller);
                    },
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: kWhite,
                      size: 25,
                    ),
                    validator: isRequired,
                  ),
                  const SizedBox(height: 33,),
                  ButtonWidget(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          if(controller.genderController.text.isEmpty || controller.genderController.text == ""){
                            FlushBarHelper(context, "Gender field is required").showErrorBar;
                          }else{
                            Get.to(() => const MaritalStatus());
                          }
                        }
                      },
                      buttonColor: kGreen,
                      borderRadius: 8,
                      buttonText: "My info is correct",
                      height: 50,
                      width: double.maxFinite),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "My info is not correct",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kGreen,
                            fontSize: 16),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
