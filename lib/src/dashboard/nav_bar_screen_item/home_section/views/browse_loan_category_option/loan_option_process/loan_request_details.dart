import 'package:crendly/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../constants/asset_path.dart';

class LoanRequestDetails extends StatefulWidget {
  const LoanRequestDetails({Key? key}) : super(key: key);

  @override
  State<LoanRequestDetails> createState() => _LoanRequestDetailsState();
}

class _LoanRequestDetailsState extends State<LoanRequestDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            backgroundColor: kDarkBackGroundColor, centerTitle: true, elevation: 0.0,
            leading:  IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios, color: kGreen, size: 20,)),
            title: Text("Loan Request Details", style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: kWhite),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Container(height: MediaQuery.of(context).size.height / 1.5, width: double.maxFinite, padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Color(0xff4700E0), borderRadius: BorderRadius.circular(8)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 64, width: 64,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: kWhite),
                              child: Center(
                                child: Image.asset(AssetPath.profilePic,),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5.0, right: 10.0,
                            child: Container(
                              height: 15, width: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue, border: Border.all(color: kWhite)),
                              child: Icon(Icons.check, color: kWhite, size: 10,),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Text("David Emmanuel", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                      Text("Loan requested on 12th Feb 2022", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                      const SizedBox(height: 10,),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true, unratedColor: Color(0xffC4C4C4),
                        itemCount: 5, itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
