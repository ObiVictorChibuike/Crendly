import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_buttom_sheet.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/loan_condition.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/view_selected_offers.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/widget/clear_icon.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import '../../lender/widgets/quick_loan_details_tile.dart';
import 'dart:developer';

class LoanBoard extends StatefulWidget {
  const LoanBoard({Key? key}) : super(key: key);

  @override
  State<LoanBoard> createState() => _LoanBoardState();
}

class _LoanBoardState extends State<LoanBoard> {
  List<dynamic> quickLoanItem = DummyData.quickLoan;
  double _amountLowerValue = 60000;
  double _amountUpperValue = 90000;

  double _durationLowerValue = 1;
  double _durationUpperValue = 7;

  double _interestLowerValue = 1;
  double _interestedUpperValue = 76;

  List<dynamic> selectedItems = [];




  void showFilterBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.5,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Filter By", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                  child: Icon(Icons.clear, color: kOrange,))
            ],
          ),
          const SizedBox(height: 31,),
          Text("Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
          const SizedBox(height: 11,),
          RangeSliderFlutter(
            // key: Key('3343'),
            values: [_amountLowerValue, _amountUpperValue],
            rangeSlider: true,
            tooltip: RangeSliderFlutterTooltip(
              leftPrefix: Text("N", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              rightPrefix: Text("N", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              alwaysShowTooltip: true,
              boxStyle: RangeSliderFlutterTooltipBox(
                  decoration: BoxDecoration(color: Colors.transparent)),
              disabled: false,
            ),
            max: 20000000,
            textPositionBottom: -150,
            handlerHeight: 30,
            trackBar:RangeSliderFlutterTrackBar(
              activeTrackBarHeight: 10,
              inactiveTrackBarHeight: 10,
              activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                gradient: LinearGradient(colors: orangeGradient),
              ),
              inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xff080808)
              ),
            ),
            min: 0, fontSize: 15,
            textBackgroundColor:Colors.deepOrangeAccent,
            onDragCompleted: (int, dynamic, String){
              setState(() {
                filter.length < 3 ?  filter.add(
                    FilterWidget(initialRangeValue: _durationLowerValue.toString(), finalRangeValue: _durationLowerValue.toString())
                ) : null;
              });
            },
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _durationLowerValue = lowerValue;
              _durationLowerValue = upperValue;
              setState(() {});
            },
          ),
          const SizedBox(height: 60,),
          Text("Duration", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
          const SizedBox(height: 11,),
          RangeSliderFlutter(
            // key: Key('3343'),
            values: [_durationLowerValue, _durationUpperValue],
            rangeSlider: true,
            tooltip: RangeSliderFlutterTooltip(
              leftSuffix: Text("Month", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              rightSuffix: Text("Months", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              alwaysShowTooltip: true,
              boxStyle: RangeSliderFlutterTooltipBox(
                  decoration: BoxDecoration(color: Colors.transparent)),
              disabled: false,
            ),
            max: 12,
            textPositionBottom: -150, handlerHeight: 30,
            trackBar:RangeSliderFlutterTrackBar(
              activeTrackBarHeight: 10, inactiveTrackBarHeight: 10,
              activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                gradient: LinearGradient(colors: orangeGradient),),
              inactiveTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Color(0xff080808)),
            ),
            min: 0, fontSize: 15,
            textBackgroundColor:Colors.deepOrangeAccent,
            onDragCompleted: (int, dynamic, String){
              setState(() {
                filter.add(
                    FilterWidget(initialRangeValue: _durationLowerValue.toString(), finalRangeValue: _durationUpperValue.toString())
                );
              });
            },
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _durationLowerValue = lowerValue;
              _durationUpperValue = upperValue;
              setState(() {});
            },
          ),
          const SizedBox(height: 60,),
          Text("Interest", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14),),
          const SizedBox(height: 11,),
          RangeSliderFlutter(
            textColor: kWhite,
            values: [_interestLowerValue, _interestedUpperValue],
            rangeSlider: true, suffixText: "%",
            tooltip: RangeSliderFlutterTooltip(
              leftSuffix: Text("%", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
              rightSuffix: Text("%", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                alwaysShowTooltip: true,
                boxStyle: RangeSliderFlutterTooltipBox(
                  decoration: BoxDecoration(color: Colors.transparent)),
                disabled: false,
            ),
            max: 100,
            textPositionBottom: -150,
            handlerHeight: 30,
            trackBar:RangeSliderFlutterTrackBar(
              activeTrackBarHeight: 10, inactiveTrackBarHeight: 10,
              activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                gradient: LinearGradient(colors: orangeGradient),
              ),
              inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xff080808)
              ),
            ),
            min: 0, fontSize: 15,
            onDragCompleted: (int, dynamic, String){
              setState(() {
                filter.add(FilterWidget(initialRangeValue: _interestLowerValue.toString(), finalRangeValue: _interestLowerValue.toString()));
              });
            },
            textBackgroundColor:Colors.deepOrangeAccent,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _interestLowerValue = lowerValue;
              _interestedUpperValue = upperValue;
              setState(() {});
            },
          ),
          const SizedBox(height: 56,),
          ButtonWidget(onPressed: (){
            Get.back();
            log(filter.length.toString());
          }, buttonText: "Proceed",
            height: 50, width: double.maxFinite,
            buttonColor: kGreen,
          ),
           const SizedBox(height: 53,),
        ]
    );
  }

  List<FilterWidget> filter = [];
  int maxSelect = 3;
  List<int> selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
        backgroundColor: kDarkBackGroundColor,
        appBar: CustomAppbar(centerTitle: false,
          actionWidget: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: IconButton(onPressed: (){
              showFilterBottomSheet(context);
            }, icon: Icon(Icons.filter_list, color: kWhite, size: 23,)),
          ),
          appBarLabel: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              Text(
                "Loans Offers", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),
              ),
              Text(
                "We have arranged the best loan \noffers just for you.", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),
              ),
              // filter.isNotEmpty ? Row(
              //   children: [
              //     Expanded(
              //         child: Row(
              //           children: [
              //             ...List.generate(filter.length, (index){
              //               return filter[index];
              //             })
              //           ],
              //         )
              //     ),
              //   ],
              // ) : const SizedBox()
            ],
          ),
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      FormFieldWidget(
                        onTap: (){},
                        hintText: "Search",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AssetPath.search),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      ...List.generate(quickLoanItem.length, (index){
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            Get.to(()=> LoanCondition(
                              data: quickLoanItem[index],
                            ));
                          },
                          onLongPress: (){
                            maxSelect == 0 ? null : maxSelect--;
                            setState(() {
                              selectedIndex.add(index);
                                if(selectedIndex.length > 3){
                                  null;
                                  // selectedIndex.remove(index);
                                }else{
                                  selectedItems.add(
                                    {
                                      "title": "Payday Loan",
                                      "amount": quickLoanItem[index]["amount"],
                                      "percentage": quickLoanItem[index]["percentage"],
                                      "duration": quickLoanItem[index]["duration"],
                                      "rating": quickLoanItem[index]["rating"],
                                      "paymentType" : quickLoanItem[index]["paymentType"],
                                    },
                                  );
                                }
                            });
                          },
                          child: QuickLoanDetailsTile(
                            boxColor: selectedIndex.contains(index) ? Color(0xff152D7E) : Color(0xff081952),
                            removeWidget: selectedIndex.contains(index) ?
                            InkWell(onTap: (){
                              setState(() {
                                selectedItems.remove(selectedItems[index]);
                                maxSelect == 0 || maxSelect < 3  ? maxSelect++ : null;
                                if(selectedIndex.contains(index)){
                                  selectedIndex.remove(index);
                                }
                              });
                            }, child: ClearIcon().showClearIcon) : const SizedBox(),
                            borderColor: selectedIndex.contains(index) ? Color(0xff152D7E) : Colors.transparent,
                            title: "Payday Loan",
                            paymentType: quickLoanItem[index]["paymentType"],
                            amount: quickLoanItem[index]["amount"],
                            percentage: quickLoanItem[index]["percentage"],
                            rating: quickLoanItem[index]["rating"],
                            duration: quickLoanItem[index]["duration"],
                            bottomWidget:  Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ImageStack(
                                  imageSource: ImageSource.Asset, imageRadius: 20,
                                  showTotalCount: false, backgroundColor: kWhite,
                                  imageList: DummyData.stackImages, imageBorderColor: kWhite,
                                  totalCount:DummyData.stackImages.length,
                                  imageCount: 3, imageBorderWidth: 2,
                                ),
                                const SizedBox(width: 10,),
                                Text("231 people made requests", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 14),)
                              ],
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 60,),
                    ],
                  ),
                ),
              ),
            ),
            selectedItems.isEmpty ? const SizedBox() :
            Row(
              children: [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                      color: kLightBackGroundColor,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( "${selectedItems.length} Loan offer selected", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w700),),
                              selectedItems.length == 3 ? const SizedBox() :
                              Text("Select ${maxSelect} more loan offers", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
                            ],
                          ),
                          GestureDetector(
                            onTap: ()=> Get.to(()=> ViewSelectedOffers(selectedOffers: selectedItems,)),
                            child: Container(
                              height: 50, width: 122, child: Center(child: Text("View Offers",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16, color: kDarkBackGroundColor, fontWeight: FontWeight.w700))),
                              decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 17,)
          ],
        ),
      ),
    );
  }
}
