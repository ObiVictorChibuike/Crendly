import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/loan_screen.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoansAndPortfolioScreen extends StatefulWidget {
  const LoansAndPortfolioScreen({Key? key}) : super(key: key);

  @override
  _LoansAndPortfolioScreenState createState() =>
      _LoansAndPortfolioScreenState();
}

class _LoansAndPortfolioScreenState extends State<LoansAndPortfolioScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, _) => DefaultTabController(
          initialIndex: currentIndex,
          length: 2,
          child: Scaffold(
            backgroundColor: kDarkBackGroundColor,
            appBar: AppBar(
              backgroundColor: kLightBackGroundColor, elevation: 0.0,
              leading: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios, color: kGreen,),),
              title:  Text(currentIndex == 0 ? 'My Loans' : "My Portfolio", style: Theme.of(context).textTheme.headline2!.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(children: [
                    getViewTabBar(currentIndex),
                    Positioned(left: 93, top: 30, right: 93,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        width: 210, height: 40,
                        decoration: const BoxDecoration(color: kLoanBackGroundColor, borderRadius: BorderRadius.all(Radius.circular(17)),),
                        child: TabBar(
                            onTap: (int index) {
                              setState(() {
                                currentIndex = index;
                              });
                              print("Current Index $currentIndex");
                            },
                            labelColor: kWhite,
                            unselectedLabelColor: kWhite,
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                            unselectedLabelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                            indicator: BoxDecoration(color: kLighterBackGroundColor, borderRadius: const BorderRadius.all(Radius.circular(17)), border: Border.all(color: kLoanBackGroundColor, width: 0.2)),
                            tabs: const [
                              Text('Loans',),
                              Text('Portfolio',),
                            ]),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          )),
    );
  }

  Widget getViewTabBar(int index) {
    switch (index) {
      case 0:
        return LoanScreen();
      case 1:
        return PortfolioScreen();
      default:
        return Container();
    }
  }
}
