import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/browse_loan_category_option/loan_option_process/selected_loan_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';
import '../widgets/quick_loan_details_tile.dart';

class QuickLoans extends StatefulWidget {
  final data;
  const QuickLoans({Key? key, this.data}) : super(key: key);

  @override
  State<QuickLoans> createState() => _QuickLoansState();
}

class _QuickLoansState extends State<QuickLoans> {
  List<dynamic> quickLoanItem = DummyData.quickLoan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kDarkBackGroundColor, resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading:  IconButton(onPressed: (){
              Get.back();
              }, icon: Icon(Icons.arrow_back_ios, size: 30, color: kGreen,)),
            expandedHeight: 300, floating: true, automaticallyImplyLeading: false, backgroundColor: kDarkBackGroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors:[Colors.black54,Colors.black54.withOpacity(0.3)]
                ).createShader(rect),
                blendMode: BlendMode.darken,
                child: Container(height: MediaQuery.of(context).size.height/ 2.3, width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    image: DecorationImage(image: AssetImage(widget.data["asset"]), fit: BoxFit.cover,),
                  ),
                ),
              ),
              titlePadding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 80),
              title:  FittedBox(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.2, minHeight: 50),
                        child: Text(widget.data["description"],
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 32,color: kWhite, fontWeight: FontWeight.w700,),)),
                    const SizedBox(height: 5,),
                    Text("Quis blandit tempus, risus non vivamus \ntortor natoque. Urna pellentesque tellus.", textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w400,),),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ...List.generate(quickLoanItem.length, (index){
                          return InkWell(
                            onTap: (){
                              Get.to(()=> SelectedQuickLoanDetails(data: quickLoanItem[index],));
                            },
                            child: QuickLoanDetailsTile(
                              title: quickLoanItem[index]["title"],
                              description: quickLoanItem[index]["description"],
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
                        })
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
