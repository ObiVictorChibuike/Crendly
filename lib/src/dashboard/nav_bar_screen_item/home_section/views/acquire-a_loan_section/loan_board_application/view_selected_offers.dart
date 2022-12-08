import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/loan_board_application/widget/clear_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';
import '../../lender/widgets/quick_loan_details_tile.dart';
import 'loan_condition.dart';

class ViewSelectedOffers extends StatefulWidget {
  final List<dynamic> selectedOffers;
  const ViewSelectedOffers({Key? key, required this.selectedOffers}) : super(key: key);

  @override
  State<ViewSelectedOffers> createState() => _ViewSelectedOffersState();
}

class _ViewSelectedOffersState extends State<ViewSelectedOffers> {

  showCancelLoanRequestDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.3, MediaQuery.of(context).size.width, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, color: kOrange,),),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.warning_rounded, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            Text("You have cancellTake new \nsimilar loansed all loan \nrequests.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Are you sure you want to cancel all your loan requests? ", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            const SizedBox(height: 56,),
            Text("Do you want to continue", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700,fontSize: 14),),
            const SizedBox(height: 87,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.back();
                  showRequestCancelledDialog();
                },
                buttonText: "Yes, go ahead",
                height: 50, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const SizedBox(height: 29,),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Get.back();
                },
                child: Text("Yes, Cancel",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700,fontSize: 16),)),
            const Spacer(flex: 3,),
          ],
        ),
      )
    ]);
  }

  showInterestDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.5, MediaQuery.of(context).size.width, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, color: kOrange,),),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: Center(child: SvgPicture.asset(AssetPath.exportFile)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 26,),
            Text("All Three loan request has \nbeen succeessfully submited.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 22,),
            Text("We will send notifications of your \ninterests in their loan offers. You will get \nnotified when the lenders responds.", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            const SizedBox(height: 65,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.back();
                },
                buttonText: "Go Home",
                height: 50, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const SizedBox(height: 100,),
            const Spacer(flex: 1,),
          ],
        ),
      )
    ]);
  }

  showRequestCancelledDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.8, MediaQuery.of(context).size.width, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.clear, color: kOrange,),),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(height: 65, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.check_circle, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 26,),
            Text("All loan requests cancelled", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            const SizedBox(height: 22,),
            Text("You have cancelled all loan requests.", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            const SizedBox(height: 54,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ButtonWidget(
                onPressed: (){
                  Get.back();
                },
                buttonText: "Take a new loan",
                height: 50, buttonColor: kGreen,
                width: double.maxFinite,
              ),
            ),
            const SizedBox(height: 29,),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                Get.back();
              },
                child: Text("No, not now",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700,fontSize: 16),)),
            const Spacer(flex: 3,),
          ],
        ),
      )
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(centerTitle: false, bottomPadding: 0,
            appBarLabel: Text("Loan Offers", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            onBackPressed: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 32,),
                  ...List.generate(widget.selectedOffers.length, (index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=> LoanCondition(data: widget.selectedOffers[index],));
                        widget.selectedOffers.isEmpty ? Get.back() : null;
                      },
                      child: QuickLoanDetailsTile(
                        boxColor: Color(0xff152D7E),
                        removeWidget: InkWell(onTap: (){
                          setState(() {
                            widget.selectedOffers.remove(widget.selectedOffers[index]);
                          });
                        }, child: ClearIcon().showClearIcon),
                        borderColor: Color(0xff152D7E),
                        title: "Payday Loan",
                        paymentType: widget.selectedOffers[index]["paymentType"],
                        amount: widget.selectedOffers[index]["amount"],
                        percentage: widget.selectedOffers[index]["percentage"],
                        rating: widget.selectedOffers[index]["rating"],
                        duration: widget.selectedOffers[index]["duration"],
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
                  ButtonWidget(onPressed: (){
                    showInterestDialog();
                  }, buttonText: "Show Interest", height: 50, width: double.maxFinite, buttonColor: kGreen,),
                  const SizedBox(height: 29,),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        showCancelLoanRequestDialog();
                      },
                      child: Text("Cancel all request",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontWeight: FontWeight.w700,fontSize: 16, decoration: TextDecoration.underline),)),
                  const SizedBox(height: 104,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
