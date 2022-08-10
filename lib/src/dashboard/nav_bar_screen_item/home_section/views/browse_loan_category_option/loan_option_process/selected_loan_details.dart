import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/browse_loan_category_option/loan_option_process/selected_loan_amount_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../constants/dummy_data.dart';
import '../widgets/selected_loan_details_tile.dart';

class SelectedQuickLoanDetails extends StatefulWidget {
  final data;
  const SelectedQuickLoanDetails({Key? key, this.data}) : super(key: key);

  @override
  State<SelectedQuickLoanDetails> createState() => _SelectedQuickLoanDetailsState();
}

class _SelectedQuickLoanDetailsState extends State<SelectedQuickLoanDetails> {
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
            title: Text(widget.data["title"], style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Text("Quis blandit tempus, risus non vivamus tortor natoque. Urna pellentesque tellus.", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                const SizedBox(height: 20,),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 30,),
                        ...List.generate(selectedLoanDetails.length, (index){
                          return InkWell(
                              onTap: (){
                                Get.to(()=> SelectedLoanAmountOptions(loanAmount: selectedLoanDetails[index],));
                              },
                              child: SelectedLoanDetailsTile(
                                loanRange: selectedLoanDetails[index]["loanRange"],
                                requestAvailable: selectedLoanDetails[index]["requestAvailable"],
                              )
                          );
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
