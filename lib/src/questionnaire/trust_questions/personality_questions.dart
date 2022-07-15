import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/dummy_data.dart';
import 'package:crendly/src/intro_screens/onboarding/landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_widgets/customButton.dart';
import '../../../shared_widgets/custom_appBar.dart';

class PersonalityQuestionsScreen extends StatefulWidget {
  const PersonalityQuestionsScreen({Key? key}) : super(key: key);

  @override
  _PersonalityQuestionsScreenState createState() =>
      _PersonalityQuestionsScreenState();
}

class _PersonalityQuestionsScreenState
    extends State<PersonalityQuestionsScreen> {
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
    if (_controller.page == 20) {
      Get.to(() => const LandingPage());
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.page == 0) {
      Get.to(() => const LandingPage());
    }
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  List<Widget> personalityQuestionsViews = DummyData.personalityQuestionsViews;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: Text("Personality Questions"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: personalityQuestionsViews,
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
                        margin: const EdgeInsets.only(bottom: 67),
                        child: Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: kWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 67),
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
