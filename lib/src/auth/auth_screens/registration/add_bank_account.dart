import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/auth/auth_screens/registration/create_a_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/asset_path.dart';
import '../../../../constants/color_palette.dart';
import '../../../../shared_widgets/custom_appBar.dart';
class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(color: kGreen, value: 0.5,), centerTitle: false,
            appBarLabel: Text("Add your bank account", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            decorationImagePath: AssetPath.pngLemonHead,
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 24, right: 24),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.centerLeft,
                    child: Text("Bank Name", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(height: 10,),
                FormFieldWidget(
                  hintText: "Kuda Bank",
                ),
                const SizedBox(height: 15,),
                Align(alignment: Alignment.centerLeft,
                    child: Text("Account Name", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(height: 10,),
                FormFieldWidget(
                  hintText: "Your name",
                ),
                const SizedBox(height: 15,),
                Align(alignment: Alignment.centerLeft,
                    child: Text("Account Number", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(height: 10,),
                FormFieldWidget(
                  hintText: "1234567890",
                ),
                const Spacer(),
                ButtonWidget(
                    onPressed: (){
                      Get.to(()=> const CreatePassword());
                    },
                    buttonText: "Continue",
                    height: 50, buttonColor: kGreen,
                    width: double.maxFinite
                ),
                const Spacer(),
              ],
            ),
          ),
        )
    );
  }
}
