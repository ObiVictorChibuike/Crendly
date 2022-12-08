import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loan_portfolio_tenor.dart';

class CreateALoanPortfolio extends StatefulWidget {
  const CreateALoanPortfolio({Key? key}) : super(key: key);

  @override
  State<CreateALoanPortfolio> createState() => _CreateALoanPortfolioState();
}

class _CreateALoanPortfolioState extends State<CreateALoanPortfolio> {
  String? selectedLoanType;

  List<String> loanType = [
    "Payday Loan",
    "Personal Loan",
    "Rent",
    "Gadget",
    "School Fees",
    "Medical Loan",
    "Benevolent",
    "Travel Loan"
  ];

  showLoanTypeDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width, [
          Expanded(child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40,),
                      ...List.generate(loanType.length,
                            (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedLoanType = loanType[index];
                                Get.back();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        loanType[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                            color: kWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                      selectedLoanType == loanType[index]
                                          ? const Icon(
                                        Icons.check,
                                        size: 12,
                                        color: kOrange,
                                      )
                                          : const SizedBox()
                                    ],
                                  ),
                                  const Divider(
                                    color: kLighterBackGroundColor,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ]),
              ),
            ),
          )
        ]);
  }

  Widget _commentForm(){
    var maxLine = 8;
    return Container(height: maxLine * 18.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        textInputAction: TextInputAction.next, keyboardType: TextInputType.name,
        maxLines: maxLine,
        decoration: InputDecoration(
          hintText: "Give this Loan portfolio a description",
          hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGrey, fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kWhite, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kWhite, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kWhite, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kWhite, width: 0.7)
          ),
          fillColor: Colors.transparent,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.all(15),
        ),
        cursorColor: kWhite,
        onChanged: (value){

        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(
          title: LinearProgressIndicator(
            color: kGreen,
            value: 0.1,
          ), centerTitle: false,
          appBarLabel: Text(
            "Create a Loan Portfolio",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          onBackPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              children: [
                const SizedBox(height: 22,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Gender", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50, width: double.maxFinite,
                  decoration: BoxDecoration(border: Border.all(color: kWhite, width: 0.7), borderRadius: BorderRadius.circular(8)),
                  child: TextButton(style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                    onPressed: () {
                      showLoanTypeDialog();
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedLoanType ?? "Select Loan type", style: TextStyle(color: selectedLoanType == null ? const Color(0xff868484) : kWhite, fontSize: 18),),
                        const Icon(Icons.keyboard_arrow_down, color: kWhite)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const FormFieldWidget(
                  labelTitle: "How much do you want to drop in this \nportfolio?",
                  hintText: "Portfolio Amount",
                ),
                const SizedBox(height: 16,),
                FormFieldWidget(
                  labelTitle: "How much are you willing to Loan out?",
                  hintText: "Loan amount",
                  suffixIcon: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text("Per/Person", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("About Loan", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),)),
                const SizedBox(height: 10,),
                _commentForm(),
                const SizedBox(height: 45,),
                Align(alignment: Alignment.centerRight,
                  child: ButtonWidget(
                      onPressed: () {
                        Get.to(()=> const CreateLoanPortFolioTenor());
                      },
                      buttonColor: kGreen, borderRadius: 8,
                      buttonText: "Next", height: 50,
                      width: MediaQuery.of(context).size.width/ 3
                  ),
                ),
                const SizedBox(height: 67,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
