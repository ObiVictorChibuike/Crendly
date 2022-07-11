import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List rowButtonItem = DummyData.rowButtonIcon;
  List browseOptions = DummyData.browseOptions;
  List community = DummyData.crendlyCommunity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
          key: _scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          // endDrawer: More(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 42), width: double.maxFinite, height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(color: kLightBackGroundColor, border: Border.all(color: kLightBackGroundColor),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
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
                          IconButton(onPressed: (){}, icon: SvgPicture.asset(AssetPath.search, theme: const SvgTheme(fontSize: 25),),),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none, color: kWhite,)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Container(
                      height: 56, width: double.maxFinite, decoration: BoxDecoration(color: const Color(0xff4700E0), borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AssetPath.greenLight, theme: const SvgTheme(fontSize: 25),),
                                const SizedBox(width: 5,),
                                Text("My Requests", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: kWhite)),
                                const Spacer(),
                                Text("View all", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: kGreen, decoration: TextDecoration.underline)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 28,),
                    Center(child: Text('₦350,000.00', style:Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontFamily: 'KumbhSans', fontWeight: FontWeight.bold, fontSize: 32),),),
                    const SizedBox(height: 54,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(rowButtonItem.length, (index){
                          return InkWell(
                            onTap: (){
                              // showModalBottomSheet(
                              //     context: context,
                              //     enableDrag: false,
                              //     isDismissible: false,
                              //     isScrollControlled: true,
                              //     shape: const RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                              //     backgroundColor: Colors.transparent,
                              //     builder: (context) {
                              //       int currentIndex = 0;
                              //       return StatefulBuilder(
                              //           builder:
                              //               (context, setState) =>
                              //               DraggableScrollableSheet(
                              //                 initialChildSize: 0.7,
                              //                 builder: (_,
                              //                     controller) =>
                              //                     DefaultTabController(
                              //                       initialIndex:
                              //                       currentIndex,
                              //                       length: 2,
                              //                       child: ListView(
                              //                         children: [
                              //                           Container(
                              //                             padding: const EdgeInsets
                              //                                 .symmetric(
                              //                                 horizontal:
                              //                                 22,
                              //                                 vertical: 28),
                              //                             // color:
                              //                             // backgroundColor,
                              //                             child: Column(
                              //                               crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                               children: [
                              //                                 Row(
                              //                                   mainAxisAlignment:
                              //                                   MainAxisAlignment
                              //                                       .spaceBetween,
                              //                                   children: [
                              //                                     const Text(
                              //                                       'Topup wallet',
                              //                                     ),
                              //                                     IconButton(
                              //                                         onPressed:
                              //                                             () {
                              //                                           Get.back();
                              //                                         },
                              //                                         icon:
                              //                                         const Icon(
                              //                                           Icons.cancel_outlined,
                              //                                           // color:
                              //                                           // iconColor,
                              //                                         ))
                              //                                   ],
                              //                                 ),
                              //                                 const SizedBox(
                              //                                   height: 35,
                              //                                 ),
                              //                                 const Text('How much do you want to fund',),
                              //                                 const SizedBox(
                              //                                   height: 13,
                              //                                 ),
                              //                                 const TextField(
                              //                                   style:
                              //                                   TextStyle(
                              //                                     color: Color(
                              //                                         0xff797979),
                              //                                     fontSize:
                              //                                     14,
                              //                                     fontFamily:
                              //                                     'KumbhSans',
                              //                                   ),
                              //                                   decoration: InputDecoration(
                              //                                       //enabledBorder: inputBorder,
                              //                                       hintStyle: TextStyle(
                              //                                         color:
                              //                                         Color(0xff797979),
                              //                                         fontSize:
                              //                                         14,
                              //                                         fontFamily:
                              //                                         'KumbhSans',
                              //                                       ),
                              //                                       hintText: 'Enter amount',
                              //                                       contentPadding: EdgeInsets.all(8)),
                              //                                   keyboardType:
                              //                                   TextInputType
                              //                                       .text,
                              //                                 ),
                              //                                 const SizedBox(
                              //                                   height: 43,
                              //                                 ),
                              //                                 const Text(
                              //                                   'Fund your wallet using',
                              //
                              //                                 ),
                              //                                 const SizedBox(
                              //                                   height: 8,
                              //                                 ),
                              //                                 Container(
                              //                                   decoration:
                              //                                   BoxDecoration(
                              //                                     border: Border.all(
                              //                                         color:
                              //                                         const Color(0xffFED0B7)),
                              //                                     borderRadius: const BorderRadius
                              //                                         .all(
                              //                                         Radius.circular(
                              //                                             6)),
                              //                                   ),
                              //                                   height: 39,
                              //                                   child: TabBar(
                              //                                       onTap: (int index) {
                              //                                         setState(
                              //                                                 () {
                              //                                               currentIndex =
                              //                                                   index;
                              //                                             });
                              //                                       },
                              //                                       labelColor: const Color(0xff00071F),
                              //                                       unselectedLabelColor: Colors.white,
                              //                                       labelStyle: const TextStyle(fontFamily: 'KumbhSans', fontWeight: FontWeight.bold),
                              //                                       unselectedLabelStyle: const TextStyle(
                              //                                         fontFamily:
                              //                                         'KumbhSans',
                              //                                         fontSize:
                              //                                         14,
                              //                                       ),
                              //                                       indicator: BoxDecoration(
                              //                                           color: const Color(0xffFED0B7),
                              //                                           borderRadius: const BorderRadius.all(Radius.circular(6)),
                              //                                           border: Border.all(
                              //                                             color: const Color(0xffFED0B7),
                              //                                           )),
                              //                                       tabs: const [
                              //                                         Text(
                              //                                           'Card',
                              //                                         ),
                              //                                         Text(
                              //                                           'Bank Transfer',
                              //                                         ),
                              //                                       ]),
                              //                                 ),
                              //                                 const SizedBox(
                              //                                   height: 25,
                              //                                 ),
                              //                                 // getViewTabBar(
                              //                                 //     currentIndex)
                              //                               ],
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //               ));
                              //     });
                              //_scaffoldKey.currentState?.openEndDrawer();
                            },
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(backgroundColor: kBlue, radius: 28, child: rowButtonItem[index]["icon"]),
                                const SizedBox(height: 8,),
                                Text(rowButtonItem[index]["Text"], textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: kWhite),)
                              ],
                            ),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(top: 23, left: 16, right: 16, bottom: 23,), width: double.maxFinite, height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(gradient: const LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: greenGradient),
                              border: Border.all(), borderRadius: BorderRadius.circular(12)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 44, height: 44,
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: const [
                                                  CircularProgressIndicator(value: 0.25, backgroundColor: Color(0xffADD4BE), color: Color(0xffFF0062),),
                                                  Positioned(top: 7, left: 5, right: 5, bottom: 7, child: Center(child: Text('25%')),)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text('Credit Score', style: Theme.of(context).textTheme.bodyText2?.copyWith(color:const Color(0xff070647), fontSize: 10)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('25', style: Theme.of(context).textTheme.bodyText2?.copyWith(  fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xff070647))),
                                            const SizedBox(width: 6,),
                                            Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xffFED0B7),)),
                                            const SizedBox(width: 6),
                                            Text('Taken', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('24', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xff070647)),),
                                            const SizedBox(width: 6,),
                                            Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xff4700E0),)),
                                            const SizedBox(width: 6),
                                            Text('Repaid', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IntrinsicHeight(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 25,),
                                    Column(
                                      children: [
                                        Text('Current Loan', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('-₦50,000.00', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xff070647)))
                                      ],
                                    ),
                                    const SizedBox(height: 46, child: VerticalDivider(color: Colors.red),),
                                    Column(
                                      children: [
                                        Text('Loan Limit', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('₦1,050,000.00',
                                            style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xff070647))
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    decoration: BoxDecoration(color: kWhite, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(4)),
                                    width: 128, height: 48,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AssetPath.takenLoanIcon),
                                        const Text('Take Loan')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 18), decoration: BoxDecoration(color: Colors.white,
                                      border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(4)),
                                    width: 128, height: 48,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AssetPath.repaidLoanIcon), const Text('Take Loan')
                                      ],
                                    ),
                                  ),
                                  Container(width: 37, height: 48,
                                    decoration: BoxDecoration(border: Border.all(color: kWhite), borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.more_vert, color: kWhite,),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.only(top: 23, left: 16, right: 16, bottom: 23),
                          width: double.maxFinite, height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(gradient: const LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: orangeGradient),
                              border: Border.all(), borderRadius: BorderRadius.circular(12)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 44, height: 44,
                                        child: Stack(
                                          children: const [
                                            CircularProgressIndicator(
                                              value: 0.69,
                                              backgroundColor: Color(0xffD3A48B),
                                              color: Color(0xff56E77E),
                                            ),
                                            Positioned(
                                              top: 7, left: 4,
                                              child: Text('69%'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text('Reputation', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, color: const Color(0xff070647))),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('65', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xff070647))),
                                          const SizedBox(width: 6,),
                                          Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647),))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xffFF0062),)),
                                          const SizedBox(width: 6),
                                          Text('Disbursed', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('24', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xff070647))),
                                          const SizedBox(width: 6,),
                                          Text('Loans', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 21, child: Divider(height: 3, thickness: 3, color: Color(0xff4700E0),)),
                                          const SizedBox(width: 6),
                                          Text('Collected', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647)),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IntrinsicHeight(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 25,),
                                    Column(
                                      children: [
                                        Text('Running Portfolio', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('N500,000.00', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black)
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 46, child: VerticalDivider(color: Colors.red,),),
                                    Column(
                                      children: [
                                        Text('Total Loan Disbursed', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xff070647))),
                                        Text('N3,050,000.00', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                             
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    decoration: BoxDecoration(
                                        color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(4)),
                                    width: 128, height: 48,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AssetPath.addFile),
                                        const Text('Take Loan')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(4)),
                                    width: 128, height: 48,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AssetPath.funds),
                                        const Text('Take Loan')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 37, height: 48,
                                    decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.more_vert, color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 58,),
                        Text("Browse Our Loan Category", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),
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
                        const SizedBox(height: 43,),
                        Container(width: double.maxFinite, height: MediaQuery.of(context).size.height / 7,
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
                                              child: Text("Advert board", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),)),
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
                        const SizedBox(height: 40),
                        Text("Inside Crendly’s Community", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20,fontWeight: FontWeight.w700, color: kWhite),),

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
                  ),
                ),
              )
            ],
          )),
    );
  }

  // Widget More() {
  //   return Container(
  //     color: backgroundColor,
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
  //       child: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const Text(
  //                 'Others',
  //                 style: boldSubtitle,
  //               ),
  //               IconButton(
  //                 icon: const Icon(
  //                   Icons.cancel_outlined,
  //                   color: iconColor,
  //                 ),
  //                 onPressed: () {
  //                   Get.back();
  //                 },
  //               )
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 24,
  //           ),
  //           SizedBox(
  //             height: 155,
  //             child: DottedBorder(
  //               color: const Color(0xff2E4DBD),
  //               child: Padding(
  //                 padding:
  //                 const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Container(
  //                           height: 64,
  //                           width: 64,
  //                           margin: const EdgeInsets.only(right: 16),
  //                           child: CircleAvatar(
  //                             backgroundColor:
  //                             const Color.fromRGBO(255, 255, 255, 1),
  //                             radius: 25,
  //                             child: SvgPicture.asset(
  //                               'assets/images/orange.svg',
  //                               height: 40,
  //                               width: 40,
  //                             ),
  //                           ),
  //                         ),
  //                         Column(
  //                           children: const [
  //                             Text(
  //                               'Damilare Martins',
  //                               style: boldSmallText,
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             SizedBox(
  //                               width: 206,
  //                               child: LinearProgressIndicator(
  //                                 backgroundColor: Color(0xff040F35),
  //                                 value: 80,
  //                                 color: colorLinearProgress,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Text(
  //                               'Your profile is 80% complete',
  //                               style: regularFont,
  //                             )
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 20,
  //                     ),
  //                     const Text(
  //                       'Complete your profile',
  //                       style: skipText,
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 42),
  //           Row(
  //             children: [
  //               Row(
  //                 children: const [
  //                   Text(
  //                     'Quick Menu',
  //                     style: regularFont,
  //                   ),
  //                   SizedBox(width: 3),
  //                   SizedBox(
  //                     width: 227,
  //                     child: Divider(
  //                       color: Color(0xff2E4DBD),
  //                     ),
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           Row(
  //             children: [
  //               Container(
  //                 padding: const EdgeInsets.only(top: 14),
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(8),
  //                     color: const Color(0xff4700E0),
  //                     border: Border.all(
  //                       color: const Color(0xff4700E0),
  //                     )),
  //                 height: 92,
  //                 width: 90,
  //                 child: Column(
  //                   children: const [
  //                     SizedBox(
  //                       width: 39,
  //                       height: 39,
  //                       child: CircleAvatar(
  //                           backgroundColor: Color(0xff6219FF),
  //                           radius: 25,
  //                           child: Icon(Icons.calculate_outlined)),
  //                     ),
  //                     SizedBox(height:7),
  //                     Text(
  //                       'Calculator',
  //                       style: regularFont,
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget getViewTabBar(int index) {
  //   switch (index) {
  //     case 0:
  //       return const BankCard();
  //     case 1:
  //       return const BankTransfer();
  //     default:
  //       return const BankCard();
  //   }
  // }
}
