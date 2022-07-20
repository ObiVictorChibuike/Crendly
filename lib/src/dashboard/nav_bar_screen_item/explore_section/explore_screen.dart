import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/explore_section/explore_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_path.dart';
import '../../../../constants/dummy_data.dart';
import '../../../../shared_widgets/customButton.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List community = DummyData.crendlyCommunity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 42),
            child: Column(
              children: [
                SizedBox(height: 50, width: double.maxFinite,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 40, width: 40,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: SvgPicture.asset(AssetPath.orangeHead, theme: const SvgTheme(fontSize: 25),),
                        ),
                      ),
                      const SizedBox(width: 9,),
                      Text("Hi, Damilare", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15, fontWeight: FontWeight.w700, color: kOrange),),
                      const Spacer(),
                      IconButton(onPressed: (){
                        Get.to(()=> const ExploreSearchScreen());
                      }, icon: SvgPicture.asset(AssetPath.search, theme: const SvgTheme(fontSize: 25),),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none, color: kWhite,)),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
               Expanded(
                   child: SingleChildScrollView(
                     physics: const BouncingScrollPhysics(),
                     child: Column(
                       children: [
                         Align(alignment: Alignment.centerLeft,
                             child: Text("Inside Crendly’s Community", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),)),

                         ...List.generate(community.length, (index){
                           return Padding(
                             padding: const EdgeInsets.symmetric(vertical: 20.0),
                             child: Container(height: MediaQuery.of(context).size.height / 2, width: double.maxFinite,
                               padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 27.0), decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: AssetImage(community[index]["asset"]))),
                               child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Expanded(
                                       child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2.5, minHeight: 50),
                                               child: Text(community[index]["title"],
                                                 style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 22,color: kWhite, fontWeight: FontWeight.w700),)),
                                           const SizedBox(height: 33,),
                                           ButtonWidget(
                                               onPressed: (){},borderRadius: 8, buttonColor: kWhite,
                                               buttonText: community[index]["buttonLabel"],
                                               height: 48, width: MediaQuery.of(context).size.width / 2.3
                                           ),
                                         ],
                                       )
                                   ),
                                 ],
                               ),
                             ),
                           );
                         }),
                         const SizedBox(
                           height: 40,
                         ),
                       ],
                     ),
                   )
               )
              ],
            ),
          ),
        )
    );
  }
}
