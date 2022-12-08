import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/transaction_section/views/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List userOldTransaction = DummyData.oldTransaction;
  List userTodayTransaction = DummyData.todayTransaction;
  List<PopupMenuItem> filterOptions = DummyData.transactionFilterOption;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: CustomAppbar(centerTitle: true,
            appBarLabel: Column(
              children: [
                Text("My Transaction", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
                const SizedBox(height: 15,),
                Text("See all your transaction activities", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
              ],
            ),
            onBackPressed: (){
              Get.back();
            },
          ),
          backgroundColor: kDarkBackGroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              userOldTransaction.isEmpty || userTodayTransaction.isEmpty ?
                Align(alignment: Alignment.center,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: kBlue,
                          radius: 50, child: Icon(MdiIcons.calendarTextOutline, color: kWhite, size: 50,)
                      ),
                      const SizedBox(height: 40,),
                      Text("You haven't made \nany transaction yet.", textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite,fontWeight: FontWeight.bold, fontSize: 20),)
                    ],
                  ),
                ) :
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Today", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                          const Spacer(),
                          Icon(Icons.calendar_month_outlined, color: kWhite, size: 30,),
                          const SizedBox(width: 5,),
                          PopupMenuButton(
                            color: kLightBackGroundColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.filter_list, color: kWhite, size: 30,),
                            itemBuilder: (BuildContext context)=>filterOptions)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(width: double.maxFinite, padding: EdgeInsets.all(20), decoration: BoxDecoration(
                        color: kLightBackGroundColor, borderRadius: BorderRadius.circular(8)
                      ),
                        child: Column(
                          children: [
                            ...List.generate(userTodayTransaction.length, (index){
                              return Column(
                                children: [
                                  InkWell(onTap: (){
                                    Get.to(()=> TransactionDetails(transaction:  userTodayTransaction[index],));
                                  },
                                    child: ListTile(visualDensity: VisualDensity(vertical: -3),
                                      leading: SvgPicture.asset(userTodayTransaction[index]["status"] == "Loan Disbursed"? AssetPath.loanDisbursed :
                                      userTodayTransaction[index]["status"] == "Funds Withdrawal" ? AssetPath.fundsWithdrawal :
                                      userTodayTransaction[index]["status"] == "Funded Wallet" ? AssetPath.fundedWallet :
                                      userTodayTransaction[index]["status"] == "Loan Repayment" ? AssetPath.loanRepayment : ""),
                                      title: Text(userTodayTransaction[index]["status"],
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700),),
                                      subtitle: Text(userTodayTransaction[index]["date"],
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kAlmostGrey, fontSize: 10, fontWeight: FontWeight.w400),),
                                      trailing:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(userTodayTransaction[index]["amount"],
                                            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kAlmostGrey, fontSize: 16, fontWeight: FontWeight.w700),),
                                          Text(userTodayTransaction[index]["type"],
                                            style: Theme.of(context).textTheme.bodyText1?.copyWith(color:
                                            userTodayTransaction[index]["type"] == "Debit" ? Color(0xffFF0062) : userTodayTransaction[index]["type"] == "Credit" ?
                                            kGreen : null , fontSize: 10, fontWeight: FontWeight.w700),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider()
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Align(alignment: Alignment.centerLeft,
                          child: Text("Yesterday", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 16),)),
                      const SizedBox(height: 15,),
                      Container(width: double.maxFinite, padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color(0xff081952), borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            ...List.generate(userOldTransaction.length, (index){
                              return Column(
                                children: [
                                  InkWell(onTap: (){
                                    Get.to(()=> TransactionDetails(transaction:  userOldTransaction[index],));
                                  },
                                    child: ListTile(visualDensity: VisualDensity(vertical: -3),
                                      leading: SvgPicture.asset(userOldTransaction[index]["status"] == "Loan Disbursed"? AssetPath.loanDisbursed :
                                      userOldTransaction[index]["status"] == "Funds Withdrawal" ? AssetPath.fundsWithdrawal :
                                      userOldTransaction[index]["status"] == "Funded Wallet" ? AssetPath.fundedWallet :
                                      userOldTransaction[index]["status"] == "Loan Repayment" ? AssetPath.loanRepayment : ""),
                                      title: Text(userOldTransaction[index]["status"],
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700),),
                                      subtitle: Text(userOldTransaction[index]["date"],
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kAlmostGrey, fontSize: 10, fontWeight: FontWeight.w400),),
                                      trailing:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(userOldTransaction[index]["amount"],
                                            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kAlmostGrey, fontSize: 16, fontWeight: FontWeight.w700),),
                                          Text(userOldTransaction[index]["type"],
                                            style: Theme.of(context).textTheme.bodyText1?.copyWith(color:
                                            userOldTransaction[index]["type"] == "Debit" ? Color(0xffFF0062) : userOldTransaction[index]["type"] == "Credit" ?
                                            kGreen : null , fontSize: 10, fontWeight: FontWeight.w700),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider()
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
