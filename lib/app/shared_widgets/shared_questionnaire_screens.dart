import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class SharedQuestionnaire extends StatefulWidget {
  final List<String> options;
  final String question;
  final int questionNumber;
  final int totalNumberOfQuestions;
  const SharedQuestionnaire(
      {required this.options,
      required this.question,
      required this.questionNumber,
      required this.totalNumberOfQuestions,
      Key? key})
      : super(key: key);

  @override
  _SharedQuestionnaireState createState() => _SharedQuestionnaireState();
}

class _SharedQuestionnaireState extends State<SharedQuestionnaire> {
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 21, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Question",
                  style: TextStyle(color: kOrange, fontSize: 16),
                ),
                const SizedBox(
                  width: 3,
                ),
                RichText(
                    text: TextSpan(
                        text: '${widget.questionNumber}',
                        style: TextStyle(
                            color: kOrange,
                            fontSize: 26,
                            fontFamily: "KumbhSans"),
                        children: [
                      TextSpan(
                          text: '/${widget.totalNumberOfQuestions}',
                          style: TextStyle(
                              color: kWhite,
                              fontSize: 16,
                              fontFamily: "KumbhSans"))
                    ]))
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              widget.question,
              style: TextStyle(
                  color: kWhite, fontSize: 20, fontFamily: "KumbhSans"),
            ),
            const SizedBox(
              height: 42,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.options.length,
              itemBuilder: (context, int index) => Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: kRadioBlue),
                        borderRadius: BorderRadius.circular(4.0)),
                    leading: Radio(
                      activeColor: kRadioBlue,
                      fillColor: MaterialStateProperty.all<Color>(kRadioBlue),
                      value: index,
                      groupValue: currentIndex,
                      onChanged: (int? val) {
                        setState(() {
                          currentIndex = val;
                        });
                      },
                    ),
                    title: Text(
                      widget.options[index],
                      style: TextStyle(
                          color: kWhite, fontSize: 14, fontFamily: "KumbhSans"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
