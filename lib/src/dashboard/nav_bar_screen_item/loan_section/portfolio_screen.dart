import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/call_to_action.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/loan_section/portfolio_info.dart';
import 'package:flutter/material.dart';
import 'widget/loan_and_portfolio_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int currentIndex = 0;
  List<Widget> chartsDisplay = [portfolioBarChart(), portfolioLineGraph()];
  late PageController _pageController;

  List portfolioGraphs = DummyData.portfolioGraphs;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: currentIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 21, right: 21, top: 30),
          height: MediaQuery.of(context).size.height / 2, width: 390,
          decoration: BoxDecoration(
              color: const Color(0xff081952),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
              border: Border.all()),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 250,
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: portfolioGraphs.length,
                          onPageChanged: (page) {
                            setState(() {
                              currentIndex = page;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Image.asset(portfolioGraphs[index]),
                              const SizedBox(height: 35,),
                              Row(mainAxisAlignment: MainAxisAlignment.center, children: indicators(portfolioGraphs.length, currentIndex,)),
                              const SizedBox(
                                height: 18,
                              ),
                              chartsDisplay[index],
                            ]);
                          }),
                    ),
                  ],
                )
              ),
              // Image.asset(AssetPath.portfolioBarChart),
            ],
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CallToAction(
                          assetName: AssetPath.send, actionText: "Fund Portfolio"),
                      const SizedBox(
                        width: 41,
                      ),
                      CallToAction(
                        assetName: AssetPath.withdraw,
                        actionText: "Withdraw",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Portfolios",
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize: 20, color: kWhite, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        LoanAndPortfolioCard(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (builder) => PortfolioInfo()));
                          },
                          loanType: "Portfolio Amount",
                          totalAmount: "N450,000.00",
                          loanAmount: "Payday",
                          loanDuration: "6 Months",
                          status: "Open",
                          loanAmountOrTypeHeader: "Loan Type",
                          rate: "15%",
                          interestOrRepaymentMethod: "Repayment Method",
                          interestAmountOrRepaymentMethodType: "Installment",
                          statusColor: kWhite,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        LoanAndPortfolioCard(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (builder) => PortfolioInfo()));
                          },
                          loanType: "Portfolio Amount",
                          totalAmount: "N450,000.00",
                          loanAmount: "Payday",
                          loanDuration: "6 Months",
                          status: "Running",
                          loanAmountOrTypeHeader: "Loan Type",
                          rate: "15%",
                          interestOrRepaymentMethod: "Repayment Method",
                          interestAmountOrRepaymentMethodType: "Installment",
                          statusColor: kLightOrange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
      ],
    );
  }
}

Widget portfolioBarChart() {
  return IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xffFFBA7B),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('Total Loans Taken',
                    style: TextStyle(fontSize: 10, color: kWhite)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text("N3, 500,000(65 loans)",
                style: TextStyle(
                    fontSize: 10, color: kWhite, fontWeight: FontWeight.bold))
          ],
        ),
        VerticalDivider(thickness: 1, color: kWhiteWithOpacity),
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xffFFBA7B),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('Total Loans Taken',
                    style: TextStyle(fontSize: 10, color: kWhite)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text("N3, 500,000(65 loans)",
                style: TextStyle(
                    fontSize: 10, color: kWhite, fontWeight: FontWeight.bold))
          ],
        ),
      ],
    ),
  );
}

Widget portfolioLineGraph() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 4,
            backgroundColor: kBrighterBackGroundColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text("Total interest earned",
              style: TextStyle(fontSize: 10, color: kWhite)),
        ],
      ),
      Center(
        child: Text("N4,500,000",
            style: TextStyle(
                fontSize: 10, color: kWhite, fontWeight: FontWeight.bold)),
      )
    ],
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 19,
      height: 5,
      decoration: BoxDecoration(
          color: currentIndex == index ? Color(0xffFED0B7) : kIndicatorColor,
          borderRadius: BorderRadius.circular(2.5)),
    );
  });
}
