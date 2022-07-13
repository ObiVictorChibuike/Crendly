import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/constants/values_manager.dart';
import 'package:crendly/shared_widgets/custom_appBar.dart';
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
      appBar: CustomAppbar(title: Text("Trust Questions")),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p21, vertical: AppPadding.p32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [Text("Question"), Text("${widget.questionNumber}/12")],
            ),
            const SizedBox(
              height: 35,
            ),
            Text(widget.question),
            const SizedBox(
              height: 62,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.options.length,
                itemBuilder: (context, int index) => ListTile(
                      leading: Radio(
                        value: index,
                        groupValue: currentIndex,
                        onChanged: (int? val) {
                          setState(() {
                            currentIndex = val;
                          });
                        },
                      ),
                      title: Text(widget.options[index]),
                    ))
          ],
        ),
      ),
    );
  }
}
