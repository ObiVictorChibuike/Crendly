import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/custom_appBar.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../constants/asset_path.dart';

class BioDetails extends StatelessWidget {
  const BioDetails({Key? key}) : super(key: key);

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
                height: 26,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 88,
                      width: 88,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: SvgPicture.asset(
                          AssetPath.orangeHead,
                          theme: const SvgTheme(fontSize: 25),
                          width: 60,
                          height: 71,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 195,
                      top: 55,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: kLighterBackGroundColor,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: kWhite,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 49,
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
                height: 8,
              ),
              FormFieldWidget(
                labelTitle: "Phone Number",
                hintText: "0812345678",
              ),
              const SizedBox(
                height: 8,
              ),
              FormFieldWidget(
                labelTitle: "Email address",
                hintText: "dannyrand@gmail.com",
              ),
              const SizedBox(
                height: 33,
              ),
              SizedBox(
                width: 344,
                height: 203,
                child: DottedBorder(
                    color: kBrighterBackGroundColor,
                    child: Center(
                        child: SvgPicture.asset(AssetPath.confirmSignature))),
              ),
              const SizedBox(
                height: 92,
              )
            ],
          ),
        ),
      ),
    );
  }
}
