import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/explore_section/explore_screen.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/loans_and_portfolio.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/transaction_section/views/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../nav_bar_screen_item/home_section/views/home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  late List<Widget> _screens;
  int _selectedIndex = 0;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      LoansAndPortfolioScreen(),
      TransactionScreen(),
      Explore(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kDarkBackGroundColor,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: _selectedIndex == 0
                              ? kGreen
                              : kDarkBackGroundColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Icon(
                        Icons.home_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: _selectedIndex == 1
                              ? kGreen
                              : kDarkBackGroundColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Icon(
                        MdiIcons.handCoinOutline,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                label: 'My Loans',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: _selectedIndex == 2
                              ? kGreen
                              : kDarkBackGroundColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Icon(MdiIcons.calendarTextOutline, size: 25),
                    ),
                  ],
                ),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: _selectedIndex == 3
                              ? kGreen
                              : kDarkBackGroundColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Icon(
                        MdiIcons.compassOutline,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                label: 'Explore',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kGreen,
            unselectedItemColor: Color(0xff4C5B8F),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    );
  }
}
