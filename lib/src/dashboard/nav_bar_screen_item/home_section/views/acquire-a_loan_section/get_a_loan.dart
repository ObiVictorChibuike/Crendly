import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';


class GetALoan extends StatefulWidget {
  const GetALoan({Key? key}) : super(key: key);

  @override
  State<GetALoan> createState() => _GetALoanState();
}

class _GetALoanState extends State<GetALoan> {
  List<String> loanOptions = ["Payday", "Personal", "Gadget", "School fees","Benevolent", "Medical fees", "Rent", "Travel"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(
              color: kGreen,
              value: 0.0,
            ),
            appBarLabel: Text("Get a Loan",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
            ),
            decorationImagePath: AssetPath.fullTag,
            onBackPressed: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GroupButton(
                  options: GroupButtonOptions(spacing: 8, selectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                      unselectedTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16),
                      unselectedColor: Colors.transparent,
                      mainGroupAlignment: MainGroupAlignment.start,
                      unselectedBorderColor: Color(0xff2E4DBD),
                      crossGroupAlignment: CrossGroupAlignment.start,
                      borderRadius: BorderRadius.circular(25),
                      selectedColor: const Color(0xff8095E0),
                      buttonHeight: 40,
                      buttonWidth: MediaQuery.of(context).size.width / 3.7),
                  isRadio: true,
                  onSelected: (String value, index, isSelected) {},
                  buttons: loanOptions,
                ),
                const SizedBox(height: 30,),
                Text("How much are you applying for?", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16),),
                const SizedBox(height: 10,),
                FormFieldWidget(
                  hintText: "Enter amount",
                ),
                const Spacer(flex: 5,),
                Align(alignment: Alignment.bottomRight,
                  child: ButtonWidget(onPressed: (){
                    Get.to(()=> const LoanDuration());
                  },
                      buttonText: "Next", height: 50, buttonColor: kGreen,
                      width: MediaQuery.of(context).size.width / 3
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        )
    );
  }
}
