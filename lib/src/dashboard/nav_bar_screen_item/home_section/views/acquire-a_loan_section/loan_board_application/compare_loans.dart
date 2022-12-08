import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompareLoanScreen extends StatelessWidget {
  const CompareLoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(centerTitle: false, bottomPadding: 0,
          appBarLabel: Text("Compare Loan offers", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
          onBackPressed: () {
           Get.back();
          },
        ),
        body: Column(
          children: [
            const SizedBox(height: 27,),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 21,),
                Expanded(
                  flex: 2,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 48,),
                        Text("Loan Pecks", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),),
                        const SizedBox(height: 8,),
                        Divider(color: kBrighterBackGroundColor,),
                        const SizedBox(height: 20,),
                        Text("Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),),
                        const SizedBox(height: 46,),
                        Text("Interest Rate", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),),
                        const SizedBox(height: 40,),
                        Text("Duration ", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),),
                        const SizedBox(height: 46,),
                        Text("Payment", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),),
                        const SizedBox(height: 46,),
                        Text("Reputation", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 14),),
                      ],
                    )
                ),
                const SizedBox(width: 5,),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      decoration: BoxDecoration(
                        color: kLightBackGroundColor, borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 13,),
                          Image.asset(AssetPath.carbonMoney, height: 20, width: 20,),
                          const SizedBox(height: 5,),
                          Text("Loan Type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 10),),
                          Text("School fees Loan", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 10, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 11,),
                          Divider(color: kBrighterBackGroundColor,),
                          Padding(
                              padding: EdgeInsets.all(8),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 16,),
                                Text("N50,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                const SizedBox(height: 12,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 9,),
                                Container(
                                  padding: EdgeInsets.all(5), decoration: BoxDecoration(
                                  color: kDarkBackGroundColor, borderRadius: BorderRadius.circular(4),),
                                  child: Text("2% per annum", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700),),
                                ),
                                const SizedBox(height: 10,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 9,),
                                Text("6 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                const SizedBox(height: 14,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 11,),
                                Text("Installmental\n(Monthly)", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                const SizedBox(height: 20,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 22,),
                                Text("44.2%", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kLighterOrange, fontSize: 14),),
                                const SizedBox(height: 58,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(
                                    color: kGreen, borderRadius: BorderRadius.circular(4),),
                                    child: Text("Get this Loan", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kDarkBackGroundColor, fontSize: 10, fontWeight: FontWeight.w700),),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
                const SizedBox(width: 5,),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      decoration: BoxDecoration(
                          color: kLightBackGroundColor, borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 13,),
                          Image.asset(AssetPath.carbonMoney, height: 20, width: 20,),
                          const SizedBox(height: 5,),
                          Text("Loan Type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 10),),
                          Text("School fees Loan", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 10, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 11,),
                          Divider(color: kBrighterBackGroundColor,),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 16,),
                                Text("N50,000", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                const SizedBox(height: 12,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 13,),
                                Text("3% per annum", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700),),
                                const SizedBox(height: 16,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 9,),
                                Text("6 Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
                                const SizedBox(height: 14,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 19,),
                                Container(
                                  padding: EdgeInsets.all(5), decoration: BoxDecoration(
                                  color: kDarkBackGroundColor, borderRadius: BorderRadius.circular(4),),
                                  child: Text("One-off", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700),),
                                ),
                                const SizedBox(height: 17,),
                                Divider(color: kBrighterBackGroundColor,),
                                const SizedBox(height: 22,),
                                Container(
                                  padding: EdgeInsets.all(5), decoration: BoxDecoration(
                                  color: kDarkBackGroundColor, borderRadius: BorderRadius.circular(4),),
                                  child: Text("85.2%", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700),),
                                ),
                                const SizedBox(height: 58,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(
                                    color: kGreen, borderRadius: BorderRadius.circular(4),),
                                    child: Text("Get this Loan", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kDarkBackGroundColor, fontSize: 10, fontWeight: FontWeight.w700),),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
                const SizedBox(width: 21,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
