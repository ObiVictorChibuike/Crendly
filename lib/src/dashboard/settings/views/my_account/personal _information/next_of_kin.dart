import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../constants/asset_path.dart';
import '../../../../../../constants/color_palette.dart';
import '../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../shared_widgets/custom_form_field_widget.dart';

class NextOfKin extends StatelessWidget {
  const NextOfKin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text(
          "Bio Details",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 34,
              ),
              Text(
                "Personal Information",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16, color: kWhite),
              ),
              const SizedBox(
                height: 29,
              ),
              Row(
                children: [
                  FormFieldWidget(
                    width: MediaQuery.of(context).size.width / 2.5,
                    labelTitle: "First Name",
                    hintText: "David",
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FormFieldWidget(
                      width: MediaQuery.of(context).size.width / 2.3,
                      labelTitle: "Last Name",
                      hintText: "Emmanuel",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              FormFieldWidget(
                hintText: "Male",
                labelTitle: "Gender",
              ),
              const SizedBox(
                height: 8,
              ),
              FormFieldWidget(
                labelTitle: "Date of birth",
                hintText: "08/08/1994",
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.calendar_today,
                      color: kWhite,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldWidget(
                labelTitle: "Phone Number",
                hintText: "0812345678",
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldWidget(
                labelTitle: "Email address",
                hintText: "dannyrand@gmail.com",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Relationship to next of kin",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kDisableColor,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(color: kWhite, width: 0.7),
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {
                    //showAreaDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select option",
                        style: TextStyle(color: kWhite, fontSize: 18),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: kOrange)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Text(
                "Contact Address",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16, color: kWhite),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FormFieldWidget(
                        labelTitle: "Residence",
                        labelTitleTextStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kOrange),
                        width: MediaQuery.of(context).size.width / 2.5,
                        hintText: "House Number",
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          FormFieldWidget(
                            width: MediaQuery.of(context).size.width / 2.3,
                            hintText: "Apartment No",
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldWidget(
                labelTitle: "Area or Road Name",
                labelTitleTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: kOrange),
                hintText: "Street Name",
              ),
              FormFieldWidget(
                hintText: "Nearest Bus Stop/ Landmark",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LGA",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhite, width: 0.7),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent)),
                          onPressed: () {
                            //showAreaDialog();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select",
                                style: TextStyle(color: kWhite, fontSize: 14),
                              ),
                              const Icon(Icons.keyboard_arrow_down,
                                  color: kOrange)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "State",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhite, width: 0.7),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent)),
                          onPressed: () {
                            //showAreaDialog();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select",
                                style: TextStyle(color: kWhite, fontSize: 14),
                              ),
                              const Icon(Icons.keyboard_arrow_down,
                                  color: kOrange)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 73,
              )
            ],
          ),
        ),
      ),
    );
  }
}
