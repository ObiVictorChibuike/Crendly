import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_section/views/acquire-a_loan_section/complete_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../shared_widgets/customButton.dart';
import '../../../../../../../../shared_widgets/custom_appBar.dart';
import '../../../../../../../../shared_widgets/custom_dialog_widget.dart';

class TrustQuestionsScreen extends StatefulWidget {
  const TrustQuestionsScreen({Key? key}) : super(key: key);

  @override
  _TrustQuestionsScreenState createState() => _TrustQuestionsScreenState();
}

class _TrustQuestionsScreenState extends State<TrustQuestionsScreen> {
  double questionProgress = 0.083;

  void dialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2,
        MediaQuery.of(context).size.width / 1.3, [
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 3,),
                  Align(alignment: Alignment.center,
                    child: Container(height: 80, width: 80,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 3), color: const Color(0xff081952)),
                      child: Center(child: SvgPicture.asset(AssetPath.personChecked)),
                    ),
                  ),
                  Container(height: 40, width: 3, color: kGreen,),
                  const Spacer(),
                  Text("Done and Dusted!", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  const Spacer(),
                  Text("Trust questions completed. Just a \nfew more steps.",
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  const Spacer(flex: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ButtonWidget(onPressed: (){
                      Get.to(() => const CompleteProfileDetails());
                    }, buttonText: "Continue",
                        height: 50, width: double.maxFinite, buttonColor: kGreen,),
                  ),
                  const Spacer(flex: 3,),
                ],
              ))
        ]);
  }
  final _controller = PageController();
  String text = '';
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 0) {
        setState(() {
          text = '';
        });
      } else if (_controller.page == 1) {
        setState(() {
          text = 'Back';
        });
      }
    });
  }


  void next() {
    if (_controller.page == 11) {
      dialog();
    } else {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() {
        questionProgress++;
      });
    }
  }

  void previous() {
    if (_controller.page == 1) {
      Get.to(() => const CompleteProfileDetails());
    }
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  List<Widget> trustQuestionsViews = DummyData.trustQuestionsViews;

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(resizeToAvoidBottomInset: false,
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: LinearProgressIndicator(
              color: kGreen,
              value: questionProgress/trustQuestionsViews.length.toDouble(),
              valueColor: const AlwaysStoppedAnimation(kGreen),
            ),
            appBarLabel: Text("Trust Questions", style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  children: trustQuestionsViews,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: previous,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 47),
                        child: Text(text,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 37),
                      child: ButtonWidget(
                          onPressed: () {
                            next();
                            },
                          buttonColor: kGreen,
                          buttonText: "Next",
                          borderRadius: 8,
                          height: 50,
                          width: 133),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
