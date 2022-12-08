import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/src/playground/views/loan_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';


class PlayGroundHomeScreen extends StatefulWidget {
  const PlayGroundHomeScreen({Key? key}) : super(key: key);

  @override
  State<PlayGroundHomeScreen> createState() => _PlayGroundHomeScreenState();
}

class _PlayGroundHomeScreenState extends State<PlayGroundHomeScreen> {
  List buttonOption = DummyData.optionButton;
  List browseOptions = DummyData.lenderLoans;
  List achievements = DummyData.achievementDetails;
  List community = DummyData.crendlyCommunity;
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          body: Padding(
              padding: const EdgeInsets.fromLTRB(21.0, 21.0, 21.0, 0.0),
            child: SingleChildScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100, width: double.maxFinite,
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
                        IconButton(onPressed: (){}, icon: SvgPicture.asset(AssetPath.search, theme: const SvgTheme(fontSize: 25),),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none, color: kWhite,)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 52,),
                  Align(alignment: Alignment.center,
                      child: Text("₦0", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 32, fontWeight: FontWeight.w700, color: kWhite),)),
                  const SizedBox(height: 60,),
                  Container(
                    height: 62, width: double.maxFinite, padding: const EdgeInsets.fromLTRB(11.0,15.0,11.0,11.0),
                    decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(4),),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                              Expanded(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Align(alignment: Alignment.centerLeft,
                                        child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2.5, minHeight: 50),
                                            child: Text("Sign up new to enjoy full Crendly features.",
                                              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14,color: const Color(0xff00071F), fontWeight: FontWeight.w400),)),
                                      ),
                                      const Spacer(),
                                      InkWell(onTap: (){},
                                        child: Container(
                                          height: 34, width: 94, decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(4)),
                                          child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("Sign Up", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700, fontSize: 14),),
                                                  const Icon(Icons.arrow_forward_ios, size: 10,)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48,),
                  Text("What do you want to do on Crendly?", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),
                  const SizedBox(height: 24,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(buttonOption.length, (index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 246,width: MediaQuery.of(context).size.width / 2.3,
                              padding: const EdgeInsets.fromLTRB(15.0, 19.0, 15.0, 20.0),
                              decoration: BoxDecoration(gradient: LinearGradient(
                                  colors: buttonOption[index]["color"]), borderRadius: BorderRadius.circular(12)),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(height: 70, width: 70,
                                            decoration: const BoxDecoration(shape: BoxShape.circle, color: kDarkBackGroundColor),
                                            child: Center(
                                              child: SvgPicture.asset(buttonOption[index]["asset"], height: 50, width: 50, theme: const SvgTheme(fontSize: 25),),
                                            ),
                                          ),
                                          const SizedBox(height: 27.0,),
                                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 5, minHeight: 50),
                                              child: Text(buttonOption[index]["title"],
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 28, fontWeight: FontWeight.w700),)),
                                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 5, minHeight: 50),
                                              child: Text(buttonOption[index]["description"],
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),)),
                                        ],
                                      ),
                                    )
                                    ,)
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(height: 29,),
                  Text("Browse Our Loan Category", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),
                  const SizedBox(height: 24,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(browseOptions.length, (index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ShaderMask(
                              shaderCallback: (rect) => LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.center,
                                  colors:[Colors.black87,Colors.black38.withOpacity(0.1)]
                              ).createShader(rect),
                              blendMode: BlendMode.darken,
                              child: Container(height: MediaQuery.of(context).size.height / 4,width: MediaQuery.of(context).size.width / 2.3,
                                padding: const EdgeInsets.all(13.0),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: AssetImage(browseOptions[index]["asset"]))),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 90,),
                                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 4, minHeight: 50),
                                              child: Text(browseOptions[index]["description"],
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w700,),)),
                                          const SizedBox(height: 30,),
                                          ButtonWidget(
                                              onPressed: (){}, borderRadius: 8,
                                              buttonText: "View All", buttonTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                              height: 37, width: 87, buttonColor: kWhite,
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(height: 27,),
                  Container(height: 62, width: double.maxFinite, padding: const EdgeInsets.fromLTRB(11.0,15.0,11.0,11.0),
                    decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(4),),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AssetPath.calcIcon, theme: const SvgTheme(fontSize: 25),),
                                        const SizedBox(width: 30,),
                                        Align(alignment: Alignment.centerLeft,
                                          child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 5, minHeight: 50),
                                              child: Text("Make use of our calculator.",
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14,color: const Color(0xff00071F), fontWeight: FontWeight.w500),)),
                                        ),
                                        const Spacer(),
                                        InkWell(onTap: (){
                                          Get.to(()=> const PlayGroundLoanCalculator());
                                        },
                                          child: Container(
                                            height: 34, width: 113, decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(4)),
                                            child: Center(child: Text("Check it out", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700, fontSize: 14),)),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 62,),
                  Align(alignment: Alignment.center,
                      child: Text("What we have achieved so far", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w500, color: kWhite),)),
                  GridView.count(
                    crossAxisSpacing: 20, mainAxisSpacing: 20,
                    controller: controller, childAspectRatio: (1/0.6),
                    shrinkWrap: true, crossAxisCount: 2,
                    children: List.generate(achievements.length, (index){
                      return Container(
                        decoration: BoxDecoration(color: const Color(0xFF4700E0), borderRadius: BorderRadius.circular(12)),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(achievements[index]["title"],
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 28,color: kWhite, fontWeight: FontWeight.w700,),),
                            Text(achievements[index]["subTitle"],
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14,color: kWhite, fontWeight: FontWeight.w400,),)
                          ],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 40,),
                  Text("Inside Crendly’s Community", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w500, color: kWhite),),
                  const SizedBox(height: 20,),
                  ...List.generate(community.length, (index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(height: MediaQuery.of(context).size.height / 2, width: double.maxFinite,
                        padding: const EdgeInsets.fromLTRB(34.0, 40.0, 30.0, 27.0), decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: AssetImage(community[index]["asset"]))),
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
                                        height: 48, width: MediaQuery.of(context).size.width / 2.3),
                                    const Spacer(),
                                    ImageStack(
                                      imageSource: ImageSource.Asset, imageRadius: 45,
                                      showTotalCount: false, backgroundColor: kWhite,
                                      imageList: DummyData.stackImages, imageBorderColor: kWhite,
                                      totalCount:DummyData.stackImages.length,
                                      imageCount: 3, imageBorderWidth: 5,
                                    ),
                                    const SizedBox(height: 10,),
                                    Text("40 people viewed this", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  Container(width: double.maxFinite, height: MediaQuery.of(context).size.height / 8,
                    padding: const EdgeInsets.only(left: 18.0, top: 18.0, bottom: 18.0, right: 0.0),
                    decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3, minHeight: 50),
                                        child: Text("Sign up new to enjoy full Crendly features.",
                                          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),)),
                                    const Spacer(),
                                    ButtonWidget(
                                      onPressed: (){},
                                      buttonText: "Sign Up",
                                      height: 40, buttonColor: kGreen,
                                      width: 126, borderRadius: 8,
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(AssetPath.tag),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100,),
                ],
              ),
            ),
          ),

          floatingActionButton: FloatingActionButton(
              onPressed: (){},
            child: SvgPicture.asset(AssetPath.fabIcon, theme: const SvgTheme(fontSize: 25),),
          ),
        ),
    );
  }
}
