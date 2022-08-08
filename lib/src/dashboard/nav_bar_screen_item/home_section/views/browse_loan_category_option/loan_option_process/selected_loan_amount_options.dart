import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/browse_loan_category_option/loan_option_process/loan_request_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../constants/asset_path.dart';
import '../../../../../../../constants/color_palette.dart';
import '../../../../../../../constants/dummy_data.dart';

class SelectedLoanAmountOptions extends StatefulWidget {
  final loanAmount;
  const SelectedLoanAmountOptions({Key? key, this.loanAmount}) : super(key: key);

  @override
  State<SelectedLoanAmountOptions> createState() => _SelectedLoanAmountOptionsState();
}

class _SelectedLoanAmountOptionsState extends State<SelectedLoanAmountOptions> {
  List<dynamic> selectedLoanDetails = DummyData.selectedLoanDetails;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            backgroundColor: kDarkBackGroundColor, elevation: 0.0,
            leading:  IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
            title: Text(widget.loanAmount["loanRange"], style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Text("100 Loan requests under this \namount range.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(color: kWhite, width: 0.7),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AssetPath.search, theme: const SvgTheme(fontSize: 25),),
                        const SizedBox(width: 15,),
                        Text("Search", style: TextStyle(color: kWhite, fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30,),
                        ...List.generate(selectedLoanDetails.length, (index){
                          return InkWell(
                            onTap: (){
                              Get.to(()=> const LoanRequestDetails());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(width: double.maxFinite, padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(4)),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Loan request", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 20,),),
                                        const SizedBox(height: 10,),
                                        Text(selectedLoanDetails[index]["date"], style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),)
                                      ],
                                    ),
                                    Text(selectedLoanDetails[index]["amount"], style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
