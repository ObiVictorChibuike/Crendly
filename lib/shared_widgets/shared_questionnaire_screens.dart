import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:flutter/material.dart';

class SharedQuestionnaire extends StatefulWidget {
  final List<String> options;
  final String question;
  final int questionNumber;
  const SharedQuestionnaire(
      {required this.options,
      required this.question,
      required this.questionNumber,
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
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p21, vertical: AppPadding.p32),
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
                          text: '/12',
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
              height: 62,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.options.length,
                itemBuilder: (context, int index) => ListTile(
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
                            color: kWhite,
                            fontSize: 14,
                            fontFamily: "KumbhSans"),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
