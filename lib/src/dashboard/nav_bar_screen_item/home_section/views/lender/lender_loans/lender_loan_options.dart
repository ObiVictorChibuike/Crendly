import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';
import '../widgets/quick_loan_details_tile.dart';
import 'lender_loan_option_details.dart';

class LoanOptions extends StatefulWidget {
  final data;
  const LoanOptions({Key? key, this.data}) : super(key: key);

  @override
  State<LoanOptions> createState() => _LoanOptionsState();
}

class _LoanOptionsState extends State<LoanOptions> {
  List<dynamic> quickLoanItem = DummyData.quickLoan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kDarkBackGroundColor, resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.filter_list, color: kWhite,))
            ],
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
              titlePadding: EdgeInsets.fromLTRB(24.0, 0.0,0.0, 120),
              title:  FittedBox(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.data["title"],
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 32,color: kWhite, fontWeight: FontWeight.w700,),),
                    const SizedBox(height: 2,),
                    Text(widget.data["description"], textAlign: TextAlign.start,
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
                             Get.to(()=> const LoanRequestDetails());
                            },
                            child: QuickLoanDetailsTile(
                              title: widget.data["title"],
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
